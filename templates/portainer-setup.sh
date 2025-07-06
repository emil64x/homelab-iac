#!/bin/bash
set -euo pipefail

echo "[+] Creating Portainer volume"
docker volume create portainer_data

echo "[+] Launching Portainer"
docker run -d \
  -p 8000:8000 \
  -p 9000:9000 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce

echo "[+] Waiting for Portainer API..."
until curl -s http://localhost:9000/api/status; do sleep 3; done

echo "[+] Setting up Portainer admin user"
curl -X POST http://localhost:9000/api/users/admin/init \
  -H "Content-Type: application/json" \
  -d '{"username": "admin", "password": "${portainer_password}"}'

JWT=$(curl -s -X POST http://localhost:9000/api/auth \
  -H "Content-Type: application/json" \
  -d '{"Username": "admin", "Password": "${portainer_password}"}' | jq -r '.jwt')

echo "[+] Registering Docker environment..."
# Check if endpoint already exists
EXISTING_ENDPOINT=$(curl -s -H "Authorization: Bearer $JWT" http://localhost:9000/api/endpoints | jq '[.[] | select(.Name=="local")] | length')

if [ "$EXISTING_ENDPOINT" -eq 0 ]; then
  curl --location 'http://192.168.1.10:9000/api/endpoints' \
  --header "Authorization: Bearer $JWT" \
  --form 'Name="local"' \
  --form 'EndpointCreationType="1"'
else
  echo "[!] Docker endpoint 'local' already exists. Skipping registration."
fi

echo "[+] Waiting for Portainer to register the 'local' endpoint..."
for i in {1..10}; do
  ENDPOINT_ID=$(curl -s -H "Authorization: Bearer $JWT" http://localhost:9000/api/endpoints | jq -r '.[] | select(.Name=="local") | .Id')
  if [[ -n "$ENDPOINT_ID" && "$ENDPOINT_ID" != "null" ]]; then
    echo "[✓] Found local endpoint with ID: $ENDPOINT_ID"
    break
  fi
  echo "    Still waiting... ($i)"
  sleep 3
done

if [[ -z "$ENDPOINT_ID" || "$ENDPOINT_ID" == "null" ]]; then
  echo "[✗] Failed to retrieve local endpoint ID. Exiting."
  exit 1
fi

sleep 10

echo "[+] Registering Git stacks..."
for STACKFILE in /opt/stack-*.json; do
  echo "[+] Deploying stack from $STACKFILE"
  curl -X POST "http://localhost:9000/api/stacks/create/standalone/repository?endpointId=$ENDPOINT_ID" \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  --data @"$STACKFILE"
done

echo "[✓] Bootstrap complete"


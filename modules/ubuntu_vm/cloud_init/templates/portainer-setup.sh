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

ENDPOINT_ID=$(curl -s -H "Authorization: Bearer $JWT" http://localhost:9000/api/endpoints | jq '.[0].Id')

# Register the local Docker environment (Non-Swarm)
curl -s -X POST http://localhost:9000/api/endpoints \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  -d '{
    "Name": "local-docker",
    "EndpointType": 1,
    "URL": "unix:///var/run/docker.sock",
    "TLS": false
  }'

echo "[+] Deploying stack: cloudflared"
curl -s -X POST http://localhost:9000/api/stacks \
  -H "Authorization: Bearer $JWT" \
  -H "Content-Type: application/json" \
  --data-binary @/opt/portainer-git-stack.json \
  --data-urlencode "endpointId=$ENDPOINT_ID"


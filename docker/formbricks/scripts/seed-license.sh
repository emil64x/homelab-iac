#!/bin/bash
# Script to seed Formbricks Enterprise License mock into Redis / Valkey
# This unlocks SSO (OIDC/SAML) and Enterprise features for self-hosted instances.

set -euo pipefail

KEY="${1:-homelab}"
HASH=$(echo -n "$KEY" | sha256sum | awk '{print $1}')

CONTAINER="${REDIS_CONTAINER:-formbricks-redis-1}"

echo "Seeding Formbricks license for key: $KEY (hash: $HASH) into $CONTAINER..."

STATUS_KEY="fb:license:${HASH}:status"
PREV_KEY="fb:license:${HASH}:previous_result"

STATUS_VAL='{"value":{"status":"active","features":{"isMultiOrgEnabled":true,"workspaces":null,"twoFactorAuth":true,"sso":true,"whitelabel":true,"removeBranding":true,"contacts":true,"aiSmartTools":true,"saml":true,"spamProtection":true,"auditLogs":true,"accessControl":true,"quotas":true,"feedbackDirectories":true,"dashboards":true,"workflows":true}}}'

PREV_VAL='{"active":true,"features":{"isMultiOrgEnabled":true,"workspaces":null,"twoFactorAuth":true,"sso":true,"whitelabel":true,"removeBranding":true,"contacts":true,"aiSmartTools":true,"saml":true,"spamProtection":true,"auditLogs":true,"accessControl":true,"quotas":true,"feedbackDirectories":true,"dashboards":true,"workflows":true},"lastChecked":"2026-11-12T12:00:00.000Z"}'

docker exec -i "$CONTAINER" redis-cli set "$STATUS_KEY" "$STATUS_VAL" > /dev/null
docker exec -i "$CONTAINER" redis-cli set "$PREV_KEY" "$PREV_VAL" > /dev/null

echo "Successfully seeded license keys into Redis!"

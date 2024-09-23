#!/bin/bash
set -euo pipefail
curl -sS -X GET "https://api.cloudflare.com/client/v4/accounts/$account_id/pages/projects/$project_name" \
     -H "Authorization: Bearer $api_token" \
     -H "Content-Type:application/json" \
     | jq -r ".result.deployment_configs.production.env_vars.$variable_name.value" \
     | echo "variable_value=$(</dev/stdin)" >> $GITHUB_OUTPUT
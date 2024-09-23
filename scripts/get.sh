#!/bin/bash
set -eu
curl -sS -X GET "https://api.cloudflare.com/client/v4/accounts/$account_id/pages/projects/$project_name" \
     -H "Authorization: Bearer $api_token" \
     -H "Content-Type:application/json" \
     | jq -r ".result.deployment_configs.production.env_vars.$variable_name.value" \
     | echo "value=$(</dev/stdin)" >> $GITHUB_OUTPUT
#!/bin/sh
set -eu
curl -sSo /dev/null -X PATCH "https://api.cloudflare.com/client/v4/accounts/$account_id/pages/projects/$project_name" \
     -H "Authorization: Bearer $api_token" \
     -H "Content-Type:application/json" \
     -d '{
          "deployment_configs": {
            "production": {
              "env_vars": {
                "'"$variable_name"'": {
                  "value": "'"$variable_value"'"
                }
              }
            },
            "preview": {
              "env_vars": {
                "'"$variable_name"'": {
                  "value": "'"$variable_value"'"
                }
              }
            }
          }
        }'
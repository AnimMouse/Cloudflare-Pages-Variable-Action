# Cloudflare Pages Variable Action
Update or get Cloudflare Pages variables using GitHub Actions.

## Usage
Create a Cloudflare API token with Cloudflare Pages permission and paste it to `CF_API_TOKEN` secret.

### Update variable value
```yaml
steps:
  - name: Update variable value
    uses: AnimMouse/Cloudflare-Pages-Variable-Action@v1
    with:
      method: update
      variable_name: ${{ vars.CF_VARIABLE_NAME }}
      variable_value: hello_world
      project_name: ${{ vars.CF_PROJECT_NAME }}
      account_id: ${{ vars.CF_ACCOUNT_ID }}
      api_token: ${{ secrets.CF_API_TOKEN }}
```

### Get variable value
```yaml
steps:
  - name: Get variable value
    id: variable
    uses: AnimMouse/Cloudflare-Pages-Variable-Action@v1
    with:
      method: get
      variable_name: ${{ vars.CF_VARIABLE_NAME }}
      project_name: ${{ vars.CF_PROJECT_NAME }}
      account_id: ${{ vars.CF_ACCOUNT_ID }}
      api_token: ${{ secrets.CF_API_TOKEN }}
      
  - name: Echo current variable value
    run: echo ${{ steps.variable.outputs.variable_value }}
```
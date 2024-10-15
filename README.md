# Cloudflare Pages Variable Action
Update or get Cloudflare Pages variables using GitHub Actions.

## Usage
Create a Cloudflare API token with Cloudflare Pages permission and paste it to `CLOUDFLARE_API_TOKEN` secret.

### Update variable value
```yaml
steps:
  - name: Update variable value
    uses: AnimMouse/Cloudflare-Pages-Variable-Action@v1
    with:
      method: update
      variable_name: ${{ vars.CLOUDFLARE_VARIABLE_NAME }}
      variable_value: hello_world
      project_name: ${{ vars.CLOUDFLARE_PROJECT_NAME }}
      account_id: ${{ vars.CLOUDFLARE_ACCOUNT_ID }}
      api_token: ${{ secrets.CLOUDFLARE_API_TOKEN }}
```

### Get variable value
```yaml
steps:
  - name: Get variable value
    id: variable
    uses: AnimMouse/Cloudflare-Pages-Variable-Action@v1
    with:
      method: get
      variable_name: ${{ vars.CLOUDFLARE_VARIABLE_NAME }}
      project_name: ${{ vars.CLOUDFLARE_PROJECT_NAME }}
      account_id: ${{ vars.CLOUDFLARE_ACCOUNT_ID }}
      api_token: ${{ secrets.CLOUDFLARE_API_TOKEN }}
      
  - name: Echo current variable value
    run: echo ${{ steps.variable.outputs.variable_value }}
```

## Examples

### Update Hugo version
Automatically update Hugo version.

```yaml
name: Update Hugo
on:
  schedule:
    - cron: '7 11 * * 0'
  workflow_dispatch:
  
concurrency:
  group: ${{ github.workflow }}
  
jobs:
  update:
    uses: AnimMouse/Cloudflare-Pages-Variable-Action/.github/workflows/update-hugo.yaml@v1
    with:
      project_name: ${{ vars.CLOUDFLARE_PROJECT_NAME }}
      account_id: ${{ vars.CLOUDFLARE_ACCOUNT_ID }}
    secrets:
      api_token: ${{ secrets.CLOUDFLARE_API_TOKEN }}
```
# 2025-12-stack-patches

Starts with better-t-stack: TanStack Start, Hono, oRPC, Neon, Drizzle, Tailwind.

Then adds: 

- better-t-stack fixes

## Setup

Install [mise](https://mise.jdx.dev/) and run `mise install`

## Usage

1. Scaffold base project: `./better-tstack-create.sh`
2. Create a clone: `patchy clone`
3. Apply patches on top: `LEFTHOOK=0 patchy apply --all`

## Environment setup

## GitHub Repository Setup

### 1. Github Repository Settings

```bash
gh repo edit --enable-squash-merge --disable-merge-commit --disable-rebase-merge --delete-branch-on-merge
```

### 2. Alchemy Setup

Login locally (opens browser):
pnpm exec alchemy configure

Generate tokens for CI:
# Generate and set Alchemy secrets
openssl rand -base64 32 | gh secret set ALCHEMY_PASSWORD
openssl rand -base64 32 | gh secret set ALCHEMY_STATE_TOKEN

### 3. Cloudflare Setup

1. Go to https://dash.cloudflare.com/profile/api-tokens
2. Click Create Token
3. Use "Edit Cloudflare Workers" template
4. Create and copy the token

gh secret set CLOUDFLARE_API_TOKEN
# paste token when prompted


### 4. Neon Database Setup

Authenticate with Neon (opens browser):
pnpm dlx neonctl auth

Create project (if new):
pnpm dlx neonctl projects create --name <your-project-name> --role app --database app --cu 0.25

Set up GitHub secrets/variables:
# Create API key and set as secret
curl -s -X POST "https://console.neon.tech/api/v2/api_keys" \
-H "Authorization: Bearer $(jq -r '.access_token' ~/.config/neonctl/credentials.json)" \
-H "Content-Type: application/json" \
-d '{"key_name": "github-actions"}' | jq -r '.key' | gh secret set NEON_API_KEY

# Set project ID variable
PROJECT_ID=$(pnpm dlx neonctl projects list --output json | jq -r '.projects[0].id')
gh variable set NEON_PROJECT_ID --body "$PROJECT_ID"

# Set production DATABASE_URL
pnpm dlx neonctl connection-string --project-id "$PROJECT_ID" --role-name app --database-name app --pooled | gh secret set DATABASE_URL

Create local-dev branch:
pnpm dlx neonctl branches create --project-id "$PROJECT_ID" --name local-dev
echo "DATABASE_URL=$(pnpm dlx neonctl connection-string --project-id "$PROJECT_ID" --branch local-dev --role-name app --database-name app --pooled)" >> apps/server/.env

### 5 . Better-Auth Setup

openssl rand -base64 32 | gh secret set BETTER_AUTH_SECRET




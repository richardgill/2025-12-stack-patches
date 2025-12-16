# 2025-12-stack-patches

Patches for [better-t-stack-nov-28-2](../better-t-stack-nov-28-2/).

## Scaffolding Command

The base project was scaffolded with:

```bash
pnpm create better-t-stack@3.6.5 2025-12-stack \
  --frontend tanstack-start \
  --backend hono \
  --runtime workers \
  --database postgres \
  --orm drizzle \
  --api orpc \
  --auth better-auth \
  --payments none \
  --addons biome turborepo \
  --examples none \
  --db-setup planetscale \
  --web-deploy alchemy \
  --server-deploy alchemy \
  --package-manager pnpm \
  --git \
  --install
```

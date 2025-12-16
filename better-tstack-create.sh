#!/usr/bin/env bash
rm -rf ./upstream/ && \
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
  --install && \
mv 2025-12-stack/ upstream/ && \
(cd upstream && pnpm run check && git commit -am "format files")

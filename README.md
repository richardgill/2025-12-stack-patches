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

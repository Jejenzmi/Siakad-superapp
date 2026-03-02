# Development Guide

This document describes how to set up your local development environment for the Siakad Superapp monorepo.

## Prerequisites

| Tool | Minimum version | Notes |
|------|----------------|-------|
| [Bun](https://bun.sh/) | 1.x | Primary runtime & package manager |
| [Node.js](https://nodejs.org/) | 18 LTS | Required by some Nx plugins |
| [PostgreSQL](https://www.postgresql.org/) | 14+ | Local database |
| [Git](https://git-scm.com/) | 2.x | |
| [Docker](https://www.docker.com/) *(optional)* | 24+ | For running services in containers |

## Installation

```bash
# 1. Clone the repository
git clone https://github.com/Jejenzmi/Siakad-superapp.git
cd Siakad-superapp

# 2. Install all dependencies
bun install

# 3. Set up Husky git hooks
bun husky install
```

## Environment Variables

Each API service needs its own `.env` file inside `apps/api/<service>/`.

```bash
# Copy the template and edit it for the service you are working on
cp .env.example apps/api/auth/.env
cp .env.example apps/api/user/.env
# ... repeat for each service
```

See [`.env.example`](./.env.example) for all available variables and their descriptions.

## Running Applications

### Frontend (Next.js)

```bash
# PMB (user-facing)
bun nx serve web-pmb-user

# PMB (admin)
bun nx serve web-pmb-admin

# SIAKAD
bun nx serve web-siakad

# Other frontends follow the same pattern
bun nx serve <project-name>
```

Or use the convenience scripts in `package.json`:

```bash
bun run web:pmb:user:serve
bun run web:siakad:serve
```

### Backend (NestJS)

```bash
# Auth service
bun run api:auth:serve

# User service
bun run api:user:serve

# Student service
bun run api:student:serve
```

### All projects in parallel (development)

```bash
bun nx run-many --target=serve --all
```

## Running Tests

```bash
# Test a single project
bun nx test <project-name>

# Test all projects
bun nx run-many --target=test --all

# Test only affected projects (faster on CI / large PRs)
bun nx affected --target=test
```

## Linting

```bash
# Lint a single project
bun nx lint <project-name>

# Lint all projects
bun nx run-many --target=lint --all
```

## Building

```bash
# Build a single project
bun nx build <project-name>

# Build all projects
bun nx run-many --target=build --all
```

## Database Setup

The project uses [Drizzle ORM](https://orm.drizzle.team/) with PostgreSQL.

```bash
# 1. Make sure PostgreSQL is running and you have a database created

# 2. Set the DATABASE_URL in your service .env file, e.g.:
#    DATABASE_URL=postgresql://user:password@localhost:5432/siakad_dev

# 3. Run migrations (see drizzle.config.ts for config)
bun drizzle-kit push:pg
```

## Dependency Graph

Visualise the Nx project dependency graph in the browser:

```bash
bun nx graph
```

## Storybook

Component stories are available via Storybook:

```bash
bun nx storybook <ui-library-name>
```

## Debugging

### NestJS APIs

1. Start the service in debug mode:

   ```bash
   bun nx serve api-auth --configuration=development
   ```

2. Attach the VS Code debugger using the launch configuration in `.vscode/`.

### Next.js Frontend

Use the built-in `--inspect` flag or the VS Code **Next.js** debug configuration.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `bun install` fails | Make sure Bun ≥ 1.0 is installed: `bun --version` |
| Husky hooks not running | Run `bun husky install` again |
| Port conflicts | Check for processes on ports 3000–3010 (web) and 4000–4010 (API) |
| Database connection refused | Verify PostgreSQL is running and `DATABASE_URL` is correct |
| Nx cache stale | Clear with `bun nx reset` |

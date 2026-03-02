# Project Architecture

This document outlines the architecture of the Siakad superapp project built using TypeScript, Node.js, and Nx monorepo. It includes high-level design, components, and their interactions.

## Nx Monorepo Structure

This project uses [Nx](https://nx.dev/) as a build system and monorepo manager, providing:

- **Affected commands** – only rebuild/retest what changed
- **Dependency graph** – visualise project relationships
- **Caching** – local and (optionally) remote build caching
- **Code generation** – consistent scaffolding via generators

## Workspace Structure

```
.
├── apps/
│   ├── api/          # NestJS backend services (auth, user, student, file, email, …)
│   ├── mobile/       # React Native / Expo mobile apps
│   └── web/          # Next.js frontend applications
├── libs/
│   ├── api/          # Shared NestJS modules, guards, DTOs, services, …
│   ├── entities/     # Drizzle ORM entity definitions shared across services
│   └── web/          # Shared React/Next.js components, hooks, utilities
└── tools/            # Custom Nx generators and workspace tooling
```

## Technology Stack

| Layer | Technology |
|-------|-----------|
| Monorepo | [Nx](https://nx.dev/) |
| Frontend | [Next.js](https://nextjs.org/) (React 18) |
| Backend | [NestJS](https://nestjs.com/) |
| Mobile | [Expo](https://expo.dev/) / React Native |
| Database ORM | [Drizzle ORM](https://orm.drizzle.team/) |
| Language | TypeScript (strict) |
| Package manager | [Bun](https://bun.sh/) |
| Linting | ESLint + Prettier |
| Testing | Jest |
| UI docs | Storybook |
| Containerisation | Docker |

## High-Level Design

```
Browser / Mobile App
        │
        ▼
  Next.js Frontend  ──────────────────────────────────────────┐
        │                                                      │
        ▼                                                      ▼
  NestJS API Gateway                                    CDN / File API
        │
   ┌────┴────┐
   │ Auth    │  JWT / Refresh-token strategy
   │ User    │  User profile & roles
   │ Student │  Student data & academic records
   │ Email   │  Transactional email (SMTP / queue)
   └────┬────┘
        │
        ▼
  PostgreSQL (Drizzle ORM)
```

## Components

### Frontend Applications (`apps/web/`)

Each Next.js application is independently deployable and represents one product area:

- **web-pmb-user / web-pmb-admin** – Penerimaan Mahasiswa Baru (admissions)
- **web-siakad** – Academic information system (SIAKAD Litera)
- **web-evaluasi** – Evaluation dashboard
- **web-lms** – Learning Management System
- **web-pegawai** – Employee management
- **web-tata-usaha** – Administrative management
- **web-tracer-alumni** – Alumni tracer
- **web-akreditasi** – Accreditation portal
- **web-neo-feeder** – PDDIKTI Neo Feeder
- **web-sisfo-**** – Financial information system (akuntansi, aset, bendahara, keuangan)

### Backend Services (`apps/api/`)

NestJS microservices, each with its own environment file:

- **api-auth** – Authentication & authorisation
- **api-user** – User management
- **api-student** – Student academic records
- **api-file** – File storage & retrieval
- **api-email** – Email delivery

### Shared Libraries (`libs/`)

Libraries are prefixed by scope (`@uninus/api/*`, `@uninus/web/*`, `@uninus/entities`) and imported via TypeScript path aliases defined in `tsconfig.base.json`.

## Interactions

1. **Frontend → API**: REST over HTTPS; JWTs issued by `api-auth` are forwarded in `Authorization` headers.
2. **API → Database**: Drizzle ORM queries against a shared PostgreSQL instance; schema is defined in `libs/entities`.
3. **API → Email**: `api-email` consumes an internal queue (or direct call) and sends transactional emails via SMTP.
4. **Build System**: Nx computes the dependency graph and only rebuilds affected projects on each commit.

## Best Practices

- Keep business logic inside `libs/`; apps should only wire things together.
- Use Nx generators (`bun nx g …`) when adding new apps or libraries.
- Follow the branching strategy described in [CONTRIBUTING.md](./CONTRIBUTING.md).
- All environment secrets are managed via per-service `.env` files (see [.env.example](./.env.example)).
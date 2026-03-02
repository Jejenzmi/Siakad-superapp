# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive documentation: ARCHITECTURE.md, CONTRIBUTING.md, DEVELOPMENT.md, SECURITY.md, ROADMAP.md
- Environment variable template (`.env.example`)
- Docker ignore configuration (`.dockerignore`)
- Code coverage configuration (`.codecov.yml`)
- CI/CD workflow (`.github/workflows/ci.yml`)
- CODEOWNERS file for automatic review routing

## [0.1.1] - 2024-01-01

### Added
- Initial monorepo setup with Nx
- NestJS API services: auth, user, student, file, email
- Next.js frontend applications: PMB, SIAKAD, Evaluasi, LMS, Pegawai, Tata Usaha, Tracer Alumni, Akreditasi, Neo Feeder, Sisfo (akuntansi, aset, bendahara, keuangan)
- Shared libraries: `@uninus/api/*`, `@uninus/entities`, `@uninus/web/*`
- Drizzle ORM with PostgreSQL
- ESLint + Prettier configuration
- Husky git hooks
- Storybook for UI components
- Docker build configuration

[Unreleased]: https://github.com/Jejenzmi/Siakad-superapp/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/Jejenzmi/Siakad-superapp/releases/tag/v0.1.1

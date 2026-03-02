# Roadmap

This document describes the planned direction for the Siakad Superapp project. Items are organised by milestone; the list is not exhaustive and may change as priorities evolve.

## Current Status

The monorepo is operational and hosts the following product areas:
- PMB (Penerimaan Mahasiswa Baru) – student admissions
- SIAKAD (Litera) – academic information system
- Evaluasi – evaluation dashboard
- LMS – Learning Management System
- Pegawai – employee management
- Tata Usaha – administrative management
- Tracer Alumni – alumni tracer
- Akreditasi – accreditation portal
- Neo Feeder – PDDIKTI integration
- Sisfo Keuangan – financial information system (akuntansi, aset, bendahara, keuangan)

---

## Milestone 1 – Developer Experience & Quality (Near-term)

- [x] Nx monorepo with shared libraries
- [x] ESLint + Prettier enforced via Husky hooks
- [x] CI/CD pipeline (lint → test → build)
- [x] Comprehensive documentation (ARCHITECTURE, CONTRIBUTING, DEVELOPMENT, SECURITY)
- [ ] Increase unit test coverage to ≥ 70 % across all services
- [ ] Add end-to-end tests for critical user flows (admissions, login, grade lookup)
- [ ] Set up Storybook deployment for shared UI components

## Milestone 2 – Infrastructure & Reliability (Mid-term)

- [ ] Docker Compose configuration for full local stack (all APIs + PostgreSQL)
- [ ] Kubernetes / Helm chart for production deployment
- [ ] Centralised logging (e.g., Loki / Grafana)
- [ ] Distributed tracing (e.g., OpenTelemetry)
- [ ] Automated database migration workflow in CI/CD

## Milestone 3 – Feature Enhancements (Mid-term)

- [ ] Real-time notifications (WebSocket / SSE)
- [ ] Role-based dashboard with configurable widgets
- [ ] Offline-capable mobile app (Expo / React Native)
- [ ] Bulk data export (Excel / PDF) across all modules
- [ ] Integration with national PDDIKTI Neo Feeder API v2

## Milestone 4 – Platform Maturity (Long-term)

- [ ] Multi-tenant support for other universities
- [ ] Internationalisation (i18n) – English / Bahasa Indonesia
- [ ] Public API with OAuth 2.0 for third-party integrations
- [ ] Analytics dashboard for institutional decision-making
- [ ] Accessibility audit and WCAG 2.1 AA compliance

---

## How to Contribute to the Roadmap

Have an idea or want to prioritise an item? Open a [GitHub issue](https://github.com/Jejenzmi/Siakad-superapp/issues) with the `roadmap` label and describe your proposal.

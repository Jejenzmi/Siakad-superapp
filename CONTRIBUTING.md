# Contributing to Siakad Superapp

Thank you for your interest in contributing! Please read this guide before submitting a pull request.

## Development Setup

See [DEVELOPMENT.md](./DEVELOPMENT.md) for a full walkthrough of setting up your local environment.

Quick start:

```bash
# 1. Clone the repository
git clone https://github.com/Jejenzmi/Siakad-superapp.git
cd Siakad-superapp

# 2. Install dependencies
bun install

# 3. Copy environment template
cp .env.example apps/api/<service>/.env
# Edit the file and fill in the required values

# 4. Start the service you are working on
bun nx serve <project-name>
```

## Branching Strategy

**Never push directly to `develop` or `main`.**

Create a new branch from `develop` following these prefixes:

| Type | Branch name |
|------|-------------|
| New feature | `feature/<short-description>` |
| Bug fix | `bugfix/<short-description>` |
| Improvement / refactor | `improvement/<short-description>` |
| Hotfix | `hotfix/<short-description>` |
| Documentation | `docs/<short-description>` |

```bash
git checkout develop
git pull origin develop
git checkout -b feature/my-new-feature
```

## Commit Conventions

Use the same prefix in your commit message:

```
feature: add student grade export
bugfix: fix login redirect loop
improvement: optimise Drizzle query in student service
docs: update DEVELOPMENT.md prerequisites
```

Keep commit messages short (≤72 characters in the subject line). Use the body to explain *why*, not *what*.

## Pull Request Process

1. **Rebase / merge** `develop` into your branch before opening a PR to avoid conflicts.
2. **Fill in the PR template** – describe what changed and why.
3. **Ensure CI passes** – lint, unit tests, and build must all be green.
4. **Request a review** – at least one approval is required before merging.
5. **Squash & merge** is the preferred merge strategy.

## Resolving Conflicts

```bash
# 1. Stash your work-in-progress
git stash

# 2. Pull the latest develop
git pull origin develop

# 3. Restore your work
git stash pop

# 4. Resolve any conflicts, then continue
```

## Code Review Expectations

- Be respectful and constructive.
- Reviewers should focus on correctness, clarity, and consistency with the existing codebase.
- Authors must respond to or resolve all comments before merging.
- Large PRs should be broken into smaller, focused changes where possible.

## Code Style

- TypeScript strict mode is enabled – avoid `any`.
- ESLint and Prettier are configured at the repo root. Run `bun nx lint <project>` before pushing.
- Follow existing naming conventions in each layer (`camelCase` for variables, `PascalCase` for types/classes).

## Testing

- Add or update unit tests for every meaningful logic change.
- Run tests with `bun nx test <project>`.
- Aim to keep code coverage at or above the existing baseline.

## Security

Please review [SECURITY.md](./SECURITY.md) before reporting vulnerabilities or working on security-sensitive areas.

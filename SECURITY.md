# Security Policy

## Supported Versions

We actively maintain security fixes for the following versions:

| Version | Supported |
|---------|-----------|
| latest `develop` | ✅ |
| older releases | ❌ |

## Reporting a Vulnerability

**Please do not open a public GitHub issue for security vulnerabilities.**

If you discover a security issue, report it responsibly by emailing the maintainers at:

> **dev@uninus.ac.id**

Include as much detail as possible:

- A clear description of the vulnerability
- Steps to reproduce (proof-of-concept if applicable)
- Potential impact assessment
- Any suggested mitigations

We will acknowledge your report within **48 hours** and aim to release a patch within **14 days** for critical issues.

## Security Best Practices

### Environment Variables

- Never commit `.env` files or secrets to the repository.
- Use the provided `.env.example` as a template; fill in real values only in your local or deployment environment.
- Rotate secrets immediately if they are accidentally exposed.

### Authentication & Authorisation

- JWTs are short-lived; refresh tokens are stored securely (httpOnly cookies or secure storage).
- Role-based access control (RBAC) is enforced at the NestJS guard layer.
- Always validate user input with class-validator / Zod DTOs before processing.

### Dependencies

- Keep dependencies up to date; dependabot or similar tooling is recommended.
- Run `bun audit` periodically to check for known vulnerabilities in installed packages.
- Avoid adding unnecessary dependencies.

### Database

- Use parameterised queries (Drizzle ORM handles this by default) – never build raw SQL strings from user input.
- Apply the principle of least privilege to database roles used by each service.

### API

- Enable CORS only for trusted origins.
- Use HTTPS in all non-local environments.
- Rate-limit authentication endpoints to mitigate brute-force attacks.

## Disclosure Policy

After a vulnerability is fixed we will publish a brief security advisory describing the issue, affected versions, and the mitigation applied.

## Contact

For non-security-related issues, please open a [GitHub issue](https://github.com/Jejenzmi/Siakad-superapp/issues).

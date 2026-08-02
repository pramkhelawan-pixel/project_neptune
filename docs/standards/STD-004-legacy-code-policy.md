# Neptune Fishing Intelligence Platform

# Standard

## STD-004 – Legacy Code Policy

Version: 1.0

Status: Active

Owner: Neptune Engineering

---

# Purpose

This standard defines how legacy code shall be managed during the migration to the canonical Domain-Driven Design (DDD) architecture.

It ensures that technical debt is contained while Neptune continues to evolve.

---

# Definition of Legacy Code

Legacy code is any implementation that has been superseded by a canonical implementation but is temporarily retained to maintain compatibility.

Examples include:

- Legacy domain models
- Legacy enums
- Legacy services
- Legacy repositories
- Temporary compatibility layers

---

# Policy

Legacy code may be modified only to:

- Fix defects.
- Maintain compatibility.
- Support planned migration.

Legacy code shall not be modified to introduce:

- New features.
- New business logic.
- New architectural patterns.
- New public APIs.

---

# Canonical Development Rule

All new development shall target the canonical DDD architecture.

New code shall be implemented within the appropriate feature using the approved structure:

```
feature/

data/
domain/
presentation/
```

Within the Domain layer:

```
domain/

entities/
enums/
repositories/
services/
```

---

# Migration Principle

Migration from legacy implementations to canonical implementations shall be incremental.

Each migration must:

- Preserve application behaviour.
- Maintain a clean analyzer.
- Be independently testable.
- Be committed separately.

---

# Removal Criteria

Legacy code may only be removed when:

- No imports reference the legacy implementation.
- A canonical replacement exists.
- Flutter analyzer passes.
- Engineering Intelligence confirms there are no remaining dependencies.

---

# Engineering Rule

Legacy code exists to reduce migration risk.

It is not a development target.

---

# Compliance

All contributors shall comply with this standard.

Violations should be corrected before merging changes into the main branch.

---

# Revision History

| Version | Date | Summary |
|----------|------|---------|
| 1.0 | 2026-08-02 | Initial release |
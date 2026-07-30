# Neptune Fishing Intelligence Platform

# Coding Standards

## General Principles

- Write readable code before clever code.
- Prefer composition over inheritance.
- Keep classes focused on a single responsibility.
- Avoid duplicate logic.
- Every feature has one authoritative implementation.

---

# Clean Architecture

Every feature follows:

```
feature/
    data/
    domain/
    presentation/
```

Business logic belongs inside the Domain layer.

Presentation must never access APIs directly.

---

# Riverpod

Rules

- Providers belong inside:

presentation/providers/

- Providers expose business functionality.

- UI never creates repositories directly.

---

# Repository Pattern

Every feature contains:

Repository Interface

domain/repositories/

Repository Implementation

data/repositories/

---

# Services

Business rules belong inside:

domain/services/

Avoid creating services outside the Domain layer.

---

# DTO Rules

External API models are DTOs.

Always map:

DTO

↓

Mapper

↓

Domain Model

↓

UI

---

# Naming

Classes

PascalCase

Example

MarineRepository

KnowledgeService

RecommendationEngine

Variables

camelCase

Example

marineRepository

knowledgeService

Methods

Verb based

Examples

getMarineConditions()

searchKnowledge()

calculateConfidence()

---

# Widgets

Widgets must remain lightweight.

Business logic belongs in services.

---

# Imports

Prefer feature-relative imports.

Avoid unnecessary dependencies.

Remove unused imports before every commit.

---

# Analyzer

Every commit requires:

flutter analyze

Result:

No issues found.

---

# Commit Convention

Feature

feat(feature): description

Fix

fix(feature): description

Refactor

refactor(feature): description

Documentation

docs: description

Testing

test(feature): description

---

# Pull Request Checklist

Architecture follows standards.

Analyzer passes.

No duplicate implementations.

No dead code.

Documentation updated where necessary.

Feature tested.

Commit history is clean.
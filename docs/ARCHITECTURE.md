# Neptune Fishing Intelligence Platform

# Architecture

## Overview

Neptune follows a Feature-First Clean Architecture using Domain-Driven Design (DDD).

Every feature is isolated into three primary layers:

```
feature/
│
├── data/
├── domain/
└── presentation/
```

---

# Layer Responsibilities

## Presentation

Responsible for:

- Pages
- Widgets
- Riverpod Providers
- UI State

Presentation never communicates directly with APIs.

---

## Domain

Responsible for:

- Business Rules
- Entities
- Models
- Repository Interfaces
- Services

The Domain layer never depends on Flutter.

---

## Data

Responsible for:

- API Communication
- DTOs
- Mappers
- Repository Implementations
- Local Storage

---

# Dependency Flow

```
Presentation
      │
      ▼
Domain
      │
      ▼
Data
```

Dependencies only point downward.

---

# Feature Structure

Every feature follows this structure:

```
feature/

data/
    datasources/
    models/
    mappers/
    repositories/

domain/
    entities/
    models/
    repositories/
    services/

presentation/
    providers/
    pages/
    widgets/
```

---

# Repository Pattern

Every feature contains:

Repository Interface

```
domain/repositories/
```

Repository Implementation

```
data/repositories/
```

---

# Service Pattern

Business logic belongs inside:

```
domain/services/
```

No duplicate services outside the Domain layer.

---

# Provider Pattern

Riverpod providers belong inside:

```
presentation/providers/
```

Providers expose business functionality to the UI.

---

# Mapping

External DTOs are never exposed to the UI.

Always map:

```
DTO

↓

Mapper

↓

Domain Model

↓

UI
```

---

# Engineering Rules

1. One repository interface per feature.
2. One repository implementation per feature.
3. One service per feature.
4. One provider per feature.
5. No duplicate architecture.
6. flutter analyze must pass before every commit.
7. Every feature must have a single authoritative implementation.

---

# Release Philosophy

Neptune is developed using capability-based delivery.

Every capability must satisfy:

- Architecture
- Backend
- UI
- Integration
- Testing
- Analyzer Clean
- Git Commit

before it is considered complete.

---

Release 0.1

Neptune Intelligence Core
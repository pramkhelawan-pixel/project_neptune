# Neptune Fishing Intelligence Platform

# Architecture Decision Log

This document records significant architectural decisions made during the development of Neptune.

---

## ADR-001

Date:
2026-07-30

Decision

Adopt Feature-First Clean Architecture.

Reason

Improves scalability and separates business logic from presentation.

Status

Accepted

---

## ADR-002

Date:
2026-07-30

Decision

Use Riverpod as the application's state management solution.

Reason

Supports dependency injection, testability and modular feature development.

Status

Accepted

---

## ADR-003

Date:
2026-07-30

Decision

Adopt Repository Pattern for all external data access.

Reason

Decouples business logic from APIs and storage implementations.

Status

Accepted

---

## ADR-004

Date:
2026-07-30

Decision

Adopt DTO → Mapper → Domain Model flow.

Reason

External APIs must never be exposed directly to the UI.

Status

Accepted

---

## ADR-005

Date:
2026-07-30

Decision

Every feature shall contain one authoritative implementation for repositories, services and providers.

Reason

Eliminates duplicate architectures and reduces maintenance effort.

Status

In Progress

---

## ADR-006

Date:
2026-07-30

Decision

Deliver Neptune using capability-based releases instead of isolated feature development.

Reason

Each capability must include backend, UI, integration, testing and documentation before completion.

Status

Accepted
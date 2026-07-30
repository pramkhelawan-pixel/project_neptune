# Neptune Fishing Intelligence Platform

# Knowledge Migration Plan

## Objective

Migrate the Neptune Knowledge feature from the legacy architecture to the new
Feature-First Clean Architecture without breaking the Recommendation Engine.

---

# Current State

Two parallel architectures exist.

## Legacy

features/knowledge/

- repositories/
- services/

Uses:

- knowledge_record.dart
- knowledge_category.dart

Currently used by:

- Recommendation Engine

---

## New

features/knowledge/domain/

- entities/
- enums/
- repositories/
- services/

Currently used by:

- Knowledge Provider

---

# Migration Strategy

## Phase 1

Audit

Status

Complete

Deliverables

- Repository audit
- Service audit
- Dependency audit

---

## Phase 2

Repository Migration

Tasks

- Update repository implementation.
- Migrate Recommendation Engine.
- Verify analyzer.

---

## Phase 3

Service Migration

Tasks

- Merge legacy service functionality.
- Remove legacy service.
- Verify analyzer.

---

## Phase 4

Domain Migration

Tasks

- Replace legacy models.
- Replace legacy enums.
- Remove duplicate files.

---

## Phase 5

Cleanup

Tasks

- Remove obsolete folders.
- Remove unused imports.
- flutter analyze.
- Commit.

---

# Success Criteria

The Knowledge feature contains:

- One repository interface.
- One repository implementation.
- One service.
- One provider.
- One domain model.
- One enum set.

No duplicate architecture remains.

Analyzer passes.

Recommendation Engine operates normally.
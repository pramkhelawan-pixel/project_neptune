# Neptune Fishing Intelligence Platform

# Standard

## STD-003 – Development Workflow

Version: 1.0

Status: Active

Owner: Neptune Engineering

---

# Purpose

This standard defines the mandatory engineering workflow used to develop
Project Neptune.

It ensures every change is implemented using a consistent, repeatable,
and verifiable process.

---

# Development Lifecycle

Every engineering task shall follow the workflow below.

```
Plan

↓

Implement

↓

Verify

↓

Commit

↓

Document
```

No step may be skipped.

---

# Standard Workflow

## Step 1 — Verify Repository

Run the engineering tools before beginning work.

```powershell
.\tools\snapshot\project_snapshot.ps1

.\tools\engineering\engineering_index.ps1
```

These tools establish the current repository state.

---

## Step 2 — Verify Build

Run the analyzer.

```powershell
flutter analyze
```

The existing analyzer state must be understood before making changes.

---

## Step 3 — Implement

Implement only the active sprint objective.

Avoid unrelated modifications.

Every implementation shall satisfy:

- Single Responsibility Principle
- Clean Architecture
- Domain-Driven Design
- Feature-first organisation

---

## Step 4 — Verify

Run the analyzer again.

```powershell
flutter analyze
```

The project should remain analyzer clean.

If new issues are introduced they must be resolved before continuing.

---

## Step 5 — Engineering Intelligence

Regenerate the engineering model.

```powershell
.\tools\engineering\engineering_index.ps1
```

Engineering reports must reflect the latest repository state.

---

## Step 6 — Commit

Create a descriptive Git commit.

Example

```bash
git add .

git commit -m "feat(knowledge): implement repository search"
```

Commits should represent one logical engineering change.

---

# Development Rules

Every sprint shall have:

- One objective.
- One definition of done.
- One commit.

Large changes should be divided into multiple smaller commits.

---

# Definition of Done

A task is complete only when:

- Feature implemented.
- flutter analyze passes.
- Engineering Intelligence updated.
- Documentation updated (where required).
- Git commit created.

---

# Emergency Fixes

Critical defects may bypass normal sprint planning.

However, they shall still satisfy:

- Analyzer clean.
- Engineering Intelligence updated.
- Git commit.

---

# Engineering Principles

All development shall prioritise:

- Simplicity.
- Maintainability.
- Testability.
- Traceability.
- Architectural consistency.

---

# Revision History

| Version | Date | Summary |
|----------|------|---------|
| 1.0 | 2026-08-02 | Initial release |
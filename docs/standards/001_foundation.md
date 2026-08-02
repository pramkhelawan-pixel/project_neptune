# Neptune Engineering Standard

Document ID: STD-001

Title: Foundation Standard

Version: 1.0

Status: Active

Owner: Neptune Engineering

Last Updated: 2026-08-02

Next Review: Release 0.1

---

# Purpose

This document defines the non-negotiable engineering principles governing the development of the Neptune Fishing Intelligence Platform.

Every architectural decision, implementation, refactoring effort and engineering activity must comply with this standard.

This document is the highest engineering authority within the Neptune repository.

---

# Engineering Philosophy

Neptune is engineered as a commercial-grade software platform.

Engineering decisions prioritise:

- Correctness
- Maintainability
- Scalability
- Simplicity
- Consistency
- Long-term sustainability

Short-term convenience must never compromise long-term architecture.

---

# Engineering Principles

The following principles are mandatory.

## 1. Architecture First

Architecture is designed before implementation.

Implementation must never dictate architecture.

---

## 2. Single Source of Truth

Every production component has one authoritative implementation.

Duplicate production implementations are prohibited.

Examples include:

- Entities
- Repositories
- Services
- Providers
- Domain Contracts
- Enums

---

## 3. Feature Ownership

Every feature owns its own:

- Data
- Domain
- Presentation

Features communicate only through approved contracts.

---

## 4. Clean Architecture

All code must follow Neptune's Architecture Standard.

Dependency direction must never be violated.

---

## 5. Evidence-Based Engineering

Engineering decisions must be based on evidence.

Evidence includes:

- Project Snapshot
- Engineering Index
- flutter analyze
- Source Code

Engineering decisions must never rely solely on memory.

---

## 6. Incremental Delivery

Neptune is developed through small, complete engineering increments.

Each sprint must leave the repository in a better state than before.

---

## 7. Production Quality

Every committed change must satisfy production quality standards.

Temporary production code is prohibited.

---

## 8. Full File Replacement

When modifying existing files, complete file replacements are preferred over fragmented code snippets unless a targeted change is clearly safer and more appropriate.

Generated code must compile as a complete implementation.

---

## 9. Analyzer Discipline

flutter analyze is the primary quality gate.

Code must not be committed while analyzer errors remain unresolved unless the work is intentionally isolated in a non-production branch.

---

## 10. Continuous Improvement

Engineering standards evolve deliberately.

Changes to standards require review and version updates.

---

# Engineering Authority

Engineering authority follows this order.

1. Foundation Standard
2. Architecture Standard
3. Development Workflow
4. Project Structure Standard
5. Naming Convention Standard
6. Definition of Done
7. Architecture Decision Records
8. Project Snapshot
9. Engineering Index
10. Source Code

If conflicts exist, the higher authority takes precedence.

---

# Repository Standards

The repository must remain:

- Organised
- Predictable
- Maintainable
- Consistent

Duplicate production implementations must be eliminated.

Legacy implementations must be clearly identified.

Experimental implementations must never become production by accident.

---

# Engineering Workflow

Every engineering session follows this sequence.

```
Review Standards

↓

Project Snapshot

↓

Engineering Validation

↓

flutter analyze

↓

Implementation

↓

flutter analyze

↓

Git Commit
```

Development begins only after repository health has been assessed.

---

# Engineering Documentation

All engineering documentation belongs under:

```
docs/
```

Standards belong under:

```
docs/standards/
```

Architecture decisions belong under:

```
docs/adr/
```

Engineering reports belong under:

```
docs/engineering/
```

Generated reports must never replace engineering standards.

---

# Long-Term Vision

Neptune is developed as a long-term software platform.

Engineering decisions must support:

- Commercial deployment
- Team development
- Long-term maintenance
- Continuous enhancement
- Stable architecture

---

# Compliance

All contributors are expected to follow this standard.

Any deviation from this document must be explicitly documented through an Architecture Decision Record (ADR).

---

# Revision History

| Version | Date | Summary |
|----------|------------|------------------------------|
| 1.0 | 2026-08-02 | Initial Foundation Standard |
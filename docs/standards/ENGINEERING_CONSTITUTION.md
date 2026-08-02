# Neptune Engineering Constitution

Version: 1.0

Status: Active

Owner: Neptune Engineering

Last Updated: August 2026

---

# Mission

Neptune exists to enable anglers to consistently make better fishing decisions through trusted, explainable marine intelligence.

Every engineering decision shall support this mission.

---

# Vision

Neptune is not a weather application.

Neptune is not a catch logger.

Neptune is not simply another fishing application.

Neptune is a Marine Intelligence Platform.

The platform combines environmental intelligence, structured fishing knowledge, historical outcomes and explainable decision support into one coherent ecosystem.

---

# Engineering Philosophy

Neptune is engineered as a long-term software platform.

Architecture always takes precedence over convenience.

Temporary shortcuts that introduce technical debt are unacceptable.

Every capability should leave the platform in a better state than before.

Engineering decisions must maximise maintainability, scalability and explainability.

---

# Core Principles

## Principle 1 — Domain Before User Interface

Business concepts drive software architecture.

User interfaces consume domain models.

User interfaces never define domain models.

---

## Principle 2 — One Source of Truth

Every concept exists in exactly one authoritative location.

Examples include:

- Species
- Marine Conditions
- Knowledge Records
- Recommendations
- Fishing Sessions

Duplication of business concepts is prohibited.

---

## Principle 3 — Everything Must Be Explainable

Neptune never produces unexplained intelligence.

Every recommendation must include evidence.

Every confidence score must be traceable.

Every decision must be reproducible.

---

## Principle 4 — Knowledge First

Structured knowledge is more valuable than hard-coded logic.

Knowledge evolves independently from application code.

Knowledge drives intelligence.

---

## Principle 5 — Evidence Before Confidence

Confidence values are outputs.

Evidence produces confidence.

The user must always understand why a recommendation exists.

---

## Principle 6 — Every Session Improves Neptune

Fishing Sessions are learning opportunities.

Historical information becomes future intelligence.

Every completed session increases Neptune's knowledge.

---

## Principle 7 — Incremental Architecture

Large redesigns should be avoided.

The platform evolves through small, safe capability sprints.

Every sprint improves architecture.

---

## Principle 8 — Engineering Serves The Domain

Classes are not created because technology allows them.

Classes exist because the business domain requires them.

Every class must solve a real business problem.

---

# Domain Principles

FishingSession is the primary aggregate root.

CatchRecord belongs to a FishingSession.

MarineConditions represents the authoritative environmental snapshot.

KnowledgeRecord represents the authoritative fishing knowledge.

Recommendation consumes:

- MarineConditions
- Knowledge
- Historical Intelligence
- Fishing Session Intelligence

Analytics consume Fishing Sessions.

Artificial Intelligence consumes Analytics.

---

# Engineering Standards

Every production class shall:

- Have one responsibility.
- Be immutable whenever practical.
- Use const constructors where appropriate.
- Contain documentation.
- Pass Flutter Analyze.
- Avoid duplicated logic.
- Avoid duplicated business concepts.
- Be independently testable.
- Follow Neptune naming standards.

---

# Coding Standards

Flutter widgets never contain business logic.

Repositories abstract persistence.

Services contain business operations.

Providers coordinate application state.

Domain entities never depend on Flutter.

Business rules remain inside the domain.

---

# Documentation Standards

Every capability shall include:

- Architectural rationale.
- Production implementation.
- Future evolution notes.
- Updated documentation.

Documentation evolves together with code.

---

# Testing Philosophy

Correctness before optimisation.

Simple before clever.

Readable before compact.

Predictable before complex.

Stable before fast.

---

# Git Philosophy

Every commit represents one completed capability.

Every commit passes Flutter Analyze.

Every commit maintains a releasable codebase.

Commit messages should describe capabilities rather than implementation details.

---

# Product Philosophy

Neptune measures success by improving fishing decisions.

Feature count is not a success metric.

Trust is the primary success metric.

Every feature must provide measurable value to anglers.

---

# Artificial Intelligence Principles

Artificial Intelligence never replaces knowledge.

Artificial Intelligence augments knowledge.

Explainability is mandatory.

Learning must remain observable.

Evidence always takes precedence over prediction.

---

# Architecture Philosophy

Neptune is organised into bounded contexts.

Each bounded context owns:

- Entities
- Repositories
- Services
- Providers
- Business Rules

No bounded context owns another bounded context.

Shared concepts are referenced rather than duplicated.

---

# Capability Development Workflow

Every capability follows the same lifecycle.

1. Architecture Review
2. Domain Design
3. Production Implementation
4. Flutter Analyze
5. Engineering Review
6. Documentation Update
7. Git Commit

No capability is complete until every step has been completed successfully.

---

# Definition of Done

A capability is complete only when:

- Flutter Analyze reports zero issues.
- Architecture has been reviewed.
- Documentation has been updated.
- Business value has been demonstrated.
- Naming standards have been followed.
- No duplicated logic exists.
- No duplicated domain concepts exist.
- The code is ready for production.

---

# Neptune Values

These values guide every engineering decision made within Neptune.

## Integrity before convenience

Always choose the technically correct solution over the quickest shortcut.

## Evidence before opinion

Recommendations, intelligence and engineering decisions are supported by evidence rather than assumptions.

## Knowledge before assumptions

Neptune relies on structured knowledge and verified information.

Undocumented assumptions are unacceptable.

## Engineering before shortcuts

Long-term maintainability is more valuable than temporary speed.

## Quality before speed

Every capability must be stable, analyzer-clean and maintainable before completion.

## Learning before ego

Continuously improve the platform through observation, testing and feedback.

Evidence is valued above personal opinion.

## Users before features

Every feature must improve the angler's ability to make better decisions.

Features that create no measurable value should not be implemented.

## Long-term thinking before short-term gains

Architectural decisions should support Neptune's evolution for many years.

---

# Long-Term Goal

Neptune shall become the world's most trusted recreational marine intelligence platform.

Every engineering decision should support this objective.

---

# Engineering Motto

Build platforms.

Not features.

Create intelligence.

Not complexity.

Earn trust.

Not attention.

Engineer for decades.

Not demonstrations.
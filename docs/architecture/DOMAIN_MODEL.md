# Neptune Domain Model

Version: 1.0

Status: Active

Owner: Neptune Engineering

Last Updated: August 2026

---

# Purpose

This document defines the core business domain of the Neptune Marine Intelligence Platform.

The domain model represents the language of Neptune.

Every entity, service, repository and future feature shall align with this document.

Business concepts drive software architecture.

Technology never defines the domain.

---

# Domain Vision

Neptune models fishing as a complete decision-making process.

Fishing is not a single catch.

Fishing is a session consisting of planning, environmental conditions, recommendations, execution, outcomes and learning.

Every completed session contributes to Neptune's intelligence.

---

# Core Aggregate Roots

The platform contains four primary aggregate roots.

## MarineConditions

Purpose

Represents the environmental snapshot used throughout Neptune.

Owns

- Weather
- Wind
- Tide
- Swell
- Pressure
- Water Temperature
- Air Temperature
- Moon Phase
- Sunrise
- Sunset

Consumed by

- Recommendation Engine
- Fishing Session
- Analytics
- AI Learning

---

## KnowledgeRecord

Purpose

Represents structured fishing knowledge.

Knowledge is the authoritative source of truth.

Owns

- Species
- Bait
- Hooks
- Traces
- Sinkers
- Knots
- Presentations
- Rules
- Expert Tips

Consumed by

- Recommendation Engine
- AI Coach
- Analytics
- Future Knowledge Graph

---

## Recommendation

Purpose

Represents an explainable fishing recommendation.

Owns

- Confidence
- Evidence
- Recommendation Text
- Knowledge Used
- Marine Snapshot
- Historical Context (future)

Consumed by

- Fishing Session
- Analytics
- AI Learning

---

## FishingSession

Purpose

Represents an entire fishing trip.

FishingSession is the primary operational aggregate within Neptune.

Owns

- MarineConditions
- SessionEquipment
- SessionMetadata
- SessionStatistics
- SessionOutcome
- RecommendationSnapshot
- CatchRecord

Every CatchRecord belongs to exactly one FishingSession.

---

# Child Entities

## CatchRecord

Represents one landed or hooked fish.

Owns

- Species
- Weight
- Length
- Notes
- Photograph
- Catch Time

Does NOT own

- Weather
- Wind
- Tide
- Equipment

Those belong to FishingSession.

---

## SessionEquipment

Represents the equipment configuration used during the fishing session.

Examples

- Rod
- Reel
- Main Line
- Leader
- Trace
- Hook
- Primary Bait

---

## SessionStatistics

Represents session analytics.

Examples

- Fish Landed
- Fish Lost
- Session Duration
- Species Count
- Total Weight

---

## SessionMetadata

Technical metadata.

Examples

- Created
- Modified
- Synced
- Device
- App Version
- Knowledge Version

---

## SessionOutcome

Represents the overall success of the fishing session.

Examples

- Successful
- Partially Successful
- Unsuccessful

Future versions may include:

- Satisfaction Score
- Learning Score
- Environmental Match Score

---

# Supporting Domain Objects

Supporting objects are reusable throughout Neptune.

Examples include:

Species

Location

Beach

Bait

Hook

Leader

Trace

Presentation

Moon Phase

Wind Direction

Tide State

These objects may evolve into dedicated Value Objects.

---

# Domain Relationships

```
MarineConditions
        │
        │
        ▼
Recommendation
        │
        ▼
FishingSession
        │
        ├───────────────┐
        │               │
        ▼               ▼
CatchRecord      SessionEquipment
        │
        ▼
SessionStatistics
        │
        ▼
Analytics
        │
        ▼
AI Learning
```

---

# Domain Rules

FishingSession owns CatchRecord.

CatchRecord never exists independently.

MarineConditions is immutable.

KnowledgeRecord is the authoritative knowledge source.

Recommendations must always reference knowledge.

Analytics consumes historical sessions.

Artificial Intelligence consumes analytics.

---

# Business Language

Neptune uses business terminology rather than technical terminology.

Preferred language:

Fishing Session

Recommendation

Knowledge

Species

Catch

Marine Conditions

Evidence

Confidence

Avoid generic software terms where business language is clearer.

---

# Evolution Strategy

The domain evolves through incremental capability sprints.

Major redesigns are avoided.

Existing aggregate roots remain stable.

Supporting entities evolve over time.

Future Value Objects replace primitive fields where appropriate.

---

# Future Domain

Future releases will introduce:

Competition

Community Intelligence

Knowledge Graph

AI Coach

Offline Intelligence

Research Mode

Scientific Analytics

without changing the existing aggregate roots.

---

# Domain Goals

Correctness

Simplicity

Explainability

Scalability

Maintainability

Commercial Readiness

---

# Domain Motto

Model reality.

Preserve knowledge.

Generate intelligence.

Support better decisions.
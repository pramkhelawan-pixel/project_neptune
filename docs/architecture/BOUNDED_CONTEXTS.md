# Neptune Bounded Contexts

Version: 1.0

Status: Active

Owner: Neptune Engineering

Last Updated: August 2026

---

# Purpose

This document defines the bounded contexts of the Neptune Marine Intelligence Platform.

A bounded context is an independent business capability that owns its own language, business rules, entities and services.

Bounded contexts reduce coupling, improve maintainability and allow Neptune to evolve without large-scale redesign.

---

# Architecture Philosophy

Neptune follows Domain-Driven Design (DDD).

Each bounded context owns:

- Domain entities
- Repositories
- Services
- Providers
- Business rules
- Documentation

Bounded contexts communicate through well-defined interfaces rather than sharing internal implementation details.

---

# Current Bounded Contexts

## Authentication

### Purpose

Manage identity and access.

### Owns

- Users
- Login
- Registration
- Authentication
- Session Tokens

### Does Not Own

- Marine data
- Recommendations
- Fishing sessions

---

## Marine Intelligence

### Purpose

Provide environmental intelligence.

### Owns

- MarineConditions
- Weather
- Tide
- Swell
- Wind
- Pressure
- Temperature

### Produces

MarineConditions

### Consumers

- Recommendation Intelligence
- Fishing Session Intelligence
- Analytics Intelligence

---

## Knowledge Intelligence

### Purpose

Provide structured fishing knowledge.

### Owns

- Species
- Bait
- Hooks
- Traces
- Leaders
- Knots
- Sinkers
- Presentations
- Expert Tips
- Rules

### Produces

KnowledgeRecord

### Consumers

- Recommendation Intelligence
- Analytics Intelligence
- AI Intelligence

---

## Recommendation Intelligence

### Purpose

Generate explainable fishing recommendations.

### Owns

- Recommendation
- Evidence
- Confidence
- Readiness

### Consumes

- MarineConditions
- KnowledgeRecord
- Historical Analytics

### Produces

Recommendation

---

## Fishing Session Intelligence

### Purpose

Represent complete fishing trips.

### Owns

- FishingSession
- CatchRecord
- SessionEquipment
- SessionStatistics
- SessionMetadata
- SessionOutcome

### Consumes

- MarineConditions
- Recommendation

### Produces

Historical Fishing Data

---

## Analytics Intelligence

### Purpose

Transform historical fishing sessions into actionable intelligence.

### Owns

- Personal Statistics
- Success Rates
- Trends
- Performance Metrics
- Historical Comparisons

### Consumes

FishingSession

### Produces

Historical Intelligence

---

## Artificial Intelligence (Future)

### Purpose

Continuously improve Neptune.

### Consumes

- Analytics
- Knowledge
- Recommendations

### Produces

- Personal Learning
- Recommendation Optimisation
- Decision Support

---

# Context Relationships

```
Marine Intelligence
          │
          ▼
Recommendation Intelligence
          │
          ▼
Fishing Session Intelligence
          │
          ▼
Analytics Intelligence
          │
          ▼
Artificial Intelligence
```

Knowledge Intelligence supports every intelligence context.

Authentication supports the platform but remains independent of business logic.

---

# Dependency Rules

Bounded contexts communicate only through public interfaces.

No bounded context may directly manipulate another context's internal state.

Repositories remain private to their owning context.

Business rules remain inside their owning context.

Shared concepts should be referenced rather than duplicated.

---

# Shared Concepts

The following concepts may be referenced across contexts:

- MarineConditions
- KnowledgeRecord
- Recommendation
- FishingSession

These are the primary aggregate roots of Neptune.

---

# Future Bounded Contexts

The architecture allows future contexts without redesign.

Examples include:

- Community Intelligence
- Competition Management
- Conservation Intelligence
- Research Intelligence
- Marketplace
- Offline Synchronisation

Each future context must follow the same architectural principles.

---

# Benefits

This architecture provides:

- Loose coupling
- High cohesion
- Easier testing
- Independent evolution
- Better scalability
- Cleaner code ownership
- Improved maintainability

---

# Bounded Context Motto

Independent business capabilities.

Shared business language.

Clear ownership.

Minimal coupling.
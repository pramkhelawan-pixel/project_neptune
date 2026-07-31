# Neptune System Architecture

Version: 1.0

Status: Active

Owner: Neptune Engineering

Last Updated: August 2026

---

# Purpose

This document defines the overall software architecture of the Neptune Marine Intelligence Platform.

It serves as the authoritative reference for how Neptune is organised, how each subsystem interacts and how future capabilities are introduced.

All engineering work shall align with this architecture.

---

# Mission

Build the world's most trusted recreational marine intelligence platform through explainable intelligence, structured knowledge and engineering excellence.

---

# Architectural Principles

Neptune follows the following architectural principles:

- Clean Architecture
- Domain-Driven Design (DDD)
- Feature-Based Modularisation
- Immutable Domain Models
- Repository Pattern
- Service Layer Pattern
- Provider-Based State Management
- Explainable Intelligence
- Incremental Evolution

---

# High-Level Architecture

```
                           Neptune Platform

                                  │

 ┌───────────────────────────────────────────────────────────┐
 │                                                           │
 │                    Presentation Layer                     │
 │                                                           │
 │ Flutter UI                                                │
 │ Pages                                                     │
 │ Widgets                                                   │
 │ Navigation                                                 │
 └───────────────────────────────────────────────────────────┘
                                  │
                                  ▼
 ┌───────────────────────────────────────────────────────────┐
 │                                                           │
 │                    Application Layer                      │
 │                                                           │
 │ Riverpod Providers                                        │
 │ Controllers                                                │
 │ State Coordination                                         │
 └───────────────────────────────────────────────────────────┘
                                  │
                                  ▼
 ┌───────────────────────────────────────────────────────────┐
 │                                                           │
 │                       Domain Layer                        │
 │                                                           │
 │ Business Rules                                            │
 │ Services                                                  │
 │ Entities                                                  │
 │ Aggregate Roots                                           │
 │ Value Objects (future)                                    │
 └───────────────────────────────────────────────────────────┘
                                  │
                                  ▼
 ┌───────────────────────────────────────────────────────────┐
 │                                                           │
 │                         Data Layer                        │
 │                                                           │
 │ Repositories                                              │
 │ Data Sources                                              │
 │ API Clients                                               │
 │ Local Storage                                              │
 └───────────────────────────────────────────────────────────┘
                                  │
                                  ▼
                     External Services

                Open-Meteo
                WorldTides
                Supabase
                Future AI Services

```

---

# Bounded Contexts

Neptune is organised into independent business domains.

Each bounded context owns its own:

- Entities
- Repositories
- Services
- Providers
- Business Rules

The current bounded contexts are:

## Authentication

Responsible for:

- User accounts
- Login
- Registration
- Identity

---

## Marine Intelligence

Responsible for:

- Marine Conditions
- Weather
- Tide
- Swell
- Wind
- Pressure

Primary Aggregate

MarineConditions

---

## Knowledge Intelligence

Responsible for:

- Species
- Bait
- Hooks
- Traces
- Knots
- Expert Knowledge
- Rules

Primary Aggregate

KnowledgeRecord

---

## Recommendation Intelligence

Responsible for:

- Fishing Recommendations
- Confidence
- Evidence
- Readiness
- Decision Support

Primary Aggregate

Recommendation

---

## Fishing Session Intelligence

Responsible for:

- Fishing Sessions
- Equipment
- Catch Records
- Statistics
- Outcomes
- Timeline

Primary Aggregate

FishingSession

---

## Analytics Intelligence

Responsible for:

- Personal Statistics
- Trends
- Success Rates
- Historical Intelligence
- Reports

Primary Aggregate

AnalyticsSnapshot (future)

---

# Aggregate Roots

The following domain objects are aggregate roots.

MarineConditions

KnowledgeRecord

Recommendation

FishingSession

Other entities belong to one of these aggregate roots.

---

# Domain Relationships

```
FishingSession

│

├── MarineConditions

├── SessionEquipment

├── CatchRecord[]

├── RecommendationSnapshot[]

├── SessionStatistics

├── SessionMetadata

└── SessionOutcome

```

Recommendation consumes:

- MarineConditions

- Knowledge

- Historical Analytics

- Rules

- Fishing Session Intelligence

Analytics consumes:

- Fishing Sessions

Knowledge

Marine Conditions

Recommendations

Artificial Intelligence consumes Analytics rather than raw user input.

---

# Engine Architecture

Neptune is composed of independent engines.

## Marine Engine

Produces:

MarineConditions

---

## Knowledge Engine

Produces:

Knowledge Records

Species Intelligence

---

## Recommendation Engine

Produces:

Fishing Recommendations

Confidence

Evidence

---

## Session Engine

Produces:

Fishing Sessions

Statistics

Catch Intelligence

---

## Analytics Engine

Produces:

Historical Intelligence

Performance Analysis

Personal Trends

---

## Learning Engine (Future)

Produces:

Adaptive Intelligence

Personal Learning

Recommendation Optimisation

---

# Layer Responsibilities

Presentation

Displays information.

Contains no business logic.

---

Application

Coordinates state.

Communicates with services.

---

Domain

Contains business rules.

Contains intelligence.

Contains entities.

Independent of Flutter.

---

Data

Communicates with APIs.

Communicates with databases.

Transforms external data into domain objects.

---

# Dependency Rules

Dependencies only flow inward.

Presentation

↓

Application

↓

Domain

↓

Data

Domain never depends on:

Flutter

HTTP

Supabase

SQLite

Widgets

Repositories abstract persistence.

---

# Repository Pattern

Every bounded context owns its own repository.

Repositories expose business operations.

Repositories never expose implementation details.

---

# Service Pattern

Services implement business behaviour.

Services coordinate repositories.

Services never contain presentation logic.

---

# Provider Pattern

Providers coordinate application state.

Providers communicate with services.

Providers never contain business rules.

---

# Explainable Intelligence

Every recommendation must contain:

Confidence

Evidence

Knowledge Used

Environmental Snapshot

Historical Context (future)

Users must understand every recommendation.

---

# Artificial Intelligence

Artificial Intelligence augments Neptune.

Artificial Intelligence never replaces structured knowledge.

Learning remains observable.

Predictions remain explainable.

---

# Scalability

Neptune is designed to support:

Android

iOS

Desktop

Web

REST API

Offline Operation

Cloud Synchronisation

Artificial Intelligence

without architectural redesign.

---

# Future Evolution

Future releases will introduce:

Knowledge Graph

AI Coach

Community Intelligence

Competition Mode

Offline Intelligence

Scientific Research Support

Cloud Analytics

without changing the core architecture.

---

# Architectural Goals

Maintainability

Scalability

Explainability

Reliability

Testability

Commercial Readiness

Long-Term Evolution

---

# Architecture Motto

Build engines.

Build intelligence.

Build trust.

Everything else follows.
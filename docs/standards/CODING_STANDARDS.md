# Neptune Coding Standards

Version: 1.0

Status: Active

Owner: Neptune Engineering

Last Updated: August 2026

---

# Purpose

This document defines the coding standards used throughout the Neptune Marine Intelligence Platform.

These standards exist to maximise readability, maintainability, consistency and long-term evolution.

Every production file must follow these standards.

---

# General Principles

Write code for humans first.

Optimise for readability before cleverness.

Prefer simplicity over unnecessary abstraction.

Every class should communicate its purpose clearly.

---

# Architecture

Neptune follows Clean Architecture.

Presentation depends on Application.

Application depends on Domain.

Data depends on Domain.

Dependencies never point outward.

---

# Single Responsibility

Every class must have one responsibility.

Examples

Good

MarineRepository

RecommendationService

FishingSession

Poor

MarineRecommendationStatisticsManager

If a class name becomes difficult to describe, it probably has too many responsibilities.

---

# Naming

Use descriptive names.

Avoid abbreviations.

Avoid generic names.

Good

FishingSession

RecommendationEvidence

SessionStatistics

Poor

Manager

Helper

Data

Utils

Stuff

---

# Immutability

Domain entities should be immutable.

Use:

- final fields
- const constructors
- copyWith()

Avoid mutable public state.

---

# Documentation

Every production file begins with a documentation header.

Every public class includes documentation.

Every public method includes documentation when business intent is not obvious.

Explain why.

Not what.

---

# Formatting

Use flutter format.

Never manually align whitespace.

Keep imports organised.

Remove unused imports.

One class per file.

---

# Flutter

Widgets display information.

Widgets never contain business rules.

Widgets remain small.

Large widgets should be decomposed.

---

# Providers

Providers coordinate state.

Providers never implement business rules.

Providers communicate with services.

---

# Services

Services implement business behaviour.

Services coordinate repositories.

Services remain independent of Flutter.

---

# Repositories

Repositories abstract persistence.

Repositories expose business operations.

Repositories hide implementation details.

---

# Domain

Domain entities never import Flutter.

Domain entities never depend on UI.

Business rules belong inside the domain.

---

# Error Handling

Fail clearly.

Avoid silent failures.

Errors should provide useful debugging information.

---

# Analyzer

Every commit must pass:

flutter analyze

Warnings should be treated as future defects.

---

# Testing

Business rules should be independently testable.

Services should be testable.

Repositories should be mockable.

---

# Performance

Optimise only after correctness.

Avoid premature optimisation.

Measure before improving.

---

# Future Evolution

When extending Neptune:

Prefer extending existing domain models.

Avoid duplicate concepts.

Avoid breaking public contracts.

Favour incremental evolution.

---

# Coding Motto

Readable.

Maintainable.

Explainable.

Predictable.

Professional.
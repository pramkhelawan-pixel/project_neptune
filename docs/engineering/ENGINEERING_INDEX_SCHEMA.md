# Neptune Engineering Intelligence System

Document ID: EI-SCHEMA-001

Title: Engineering Index JSON Schema

Version: 1.0

Status: Active

Owner: Neptune Engineering

---

# Purpose

This document defines the canonical structure of
`engineering_index.json`.

Every scanner contributing to the Engineering Intelligence System
must produce data that conforms to this schema.

The Engineering Index is the single source of truth for Neptune's
engineering model.

---

# Design Principles

The Engineering Index shall be:

- Deterministic
- Machine-readable
- Human-readable
- Extensible
- Backwards compatible where practical
- Generated automatically

No scanner may modify another scanner's output.

Each scanner contributes only to its own section.

---

# Top-Level Structure

```json
{
  "project": {},
  "repository": {},
  "statistics": {},
  "features": [],
  "entities": [],
  "enums": [],
  "repositories": [],
  "services": [],
  "providers": [],
  "routes": [],
  "dependencies": [],
  "duplicates": [],
  "architecture": {},
  "analysis": {},
  "git": {},
  "metadata": {}
}
```

---

# Project

Contains repository identity.

Example

```json
{
  "name": "Project Neptune",
  "version": "1.0"
}
```

---

# Repository

Repository-level information.

Fields

- root
- generated
- branch
- commit

---

# Statistics

General repository statistics.

Fields

- dartFiles
- markdownFiles
- powershellFiles
- featureCount
- entityCount
- serviceCount
- repositoryCount
- providerCount
- enumCount

---

# Features

Array of feature objects.

Each feature contains

```json
{
  "name": "",
  "path": "",
  "dartFiles": 0
}
```

---

# Entities

Each entity contains

```json
{
  "name": "",
  "feature": "",
  "file": ""
}
```

---

# Enums

```json
{
  "name": "",
  "feature": "",
  "file": ""
}
```

---

# Repositories

```json
{
  "name": "",
  "feature": "",
  "interface": true,
  "implementation": false,
  "file": ""
}
```

---

# Services

```json
{
  "name": "",
  "feature": "",
  "file": ""
}
```

---

# Providers

```json
{
  "name": "",
  "feature": "",
  "providerType": "",
  "file": ""
}
```

---

# Routes

```json
{
  "name": "",
  "feature": "",
  "file": ""
}
```

---

# Dependencies

Represents feature-to-feature dependencies.

```json
{
  "from": "",
  "to": ""
}
```

---

# Duplicates

Represents duplicate engineering contracts.

```json
{
  "type": "",
  "name": "",
  "files": []
}
```

---

# Architecture

Architecture health.

Example

```json
{
  "status": "PASS",
  "violations": 0
}
```

---

# Analysis

Results from flutter analyze.

Example

```json
{
  "status": "PASS",
  "errors": 0,
  "warnings": 0
}
```

---

# Git

Repository state.

Example

```json
{
  "branch": "main",
  "clean": true,
  "lastCommit": ""
}
```

---

# Metadata

Engineering Intelligence metadata.

Example

```json
{
  "schemaVersion": "1.0",
  "generatedBy": "Engineering Intelligence",
  "generatedOn": ""
}
```

---

# Scanner Responsibilities

| Scanner | Section |
|----------|---------|
| Repository Scanner | repository, features |
| Statistics Scanner | statistics |
| Entity Scanner | entities |
| Enum Scanner | enums |
| Repository Scanner (Dart) | repositories |
| Service Scanner | services |
| Provider Scanner | providers |
| Route Scanner | routes |
| Dependency Scanner | dependencies |
| Duplicate Scanner | duplicates |
| Architecture Scanner | architecture |
| Analyzer Scanner | analysis |
| Git Scanner | git |

Each scanner owns exactly one responsibility.

---

# Engineering Rule

The Engineering Index is the authoritative engineering model for Neptune.

Markdown reports, dashboards, summaries and future AI tooling must derive their information from the Engineering Index rather than scanning the repository independently.

---

# Revision History

| Version | Date | Summary |
|----------|------|---------|
| 1.0 | 2026-08-02 | Initial Engineering Index Schema |
# -----------------------------------------------------------------------------
# Neptune Fishing Intelligence Platform
# -----------------------------------------------------------------------------
# Standard
# -----------------------------------------------------------------------------
#
# STD-004 — Canonical Domain Freeze
#
# Status:
# Approved
#
# Version:
# 1.0
#
# Owner:
# Neptune Engineering
#
# -----------------------------------------------------------------------------

# STD-004 — Canonical Domain Freeze

## Purpose

This standard defines the governance rules for Neptune's canonical domain
model.

Its objective is to preserve architectural integrity, prevent domain drift and
ensure that all business logic is implemented against a single authoritative
domain model.

---

# Principles

The canonical domain model is the single source of truth for all business
logic within Neptune.

All layers of the application shall adapt to the canonical domain.

The canonical domain shall not adapt to external systems, legacy code or user
interface requirements.

---

# 1. Domain Approval

A canonical domain entity becomes frozen immediately after architectural
approval.

Once approved, it shall be regarded as production architecture.

---

# 2. Domain Changes

No new fields shall be added to a canonical entity without an approved
Architecture Decision Record (ADR).

Removing fields shall require the same approval process.

---

# 3. Semantic Stability

Existing fields shall not change their business meaning.

Renaming for clarity is permitted only when approved through the architecture
review process.

Business semantics shall remain stable throughout the lifetime of the entity.

---

# 4. Canonical First

Legacy compatibility shall never dictate the design of the canonical domain.

Legacy implementations shall migrate towards the canonical model.

The canonical model shall never be redesigned solely to accommodate legacy
code.

---

# 5. Migration

Migration code shall exist only for the duration of the migration.

After migration is complete:

- Legacy entities shall be removed.
- Compatibility adapters shall be removed.
- Temporary mapping logic shall be removed.
- Duplicate implementations shall be removed.

---

# 6. Repository Independence

Repositories, services, providers and presentation layers shall depend only on
canonical domain entities.

No production component shall depend directly on legacy models.

---

# 7. Architecture Governance

Any modification to a canonical domain entity requires:

- Architecture review.
- Updated engineering documentation.
- Successful Flutter analysis.
- Successful automated tests where applicable.
- Dedicated Git commit.

---

# 8. Engineering Philosophy

The objective of this standard is stability.

A stable domain enables:

- predictable repositories;
- predictable services;
- predictable AI reasoning;
- predictable recommendation engines;
- predictable integrations;
- long-term maintainability.

Architectural stability shall always take precedence over short-term
convenience.

---

# Compliance

All Neptune features shall comply with STD-004.

Non-compliance shall be treated as an architectural defect.

---

# Related Standards

- STD-001 — Foundation
- STD-002 — Architecture
- STD-003 — Development Workflow

---

End of Standard
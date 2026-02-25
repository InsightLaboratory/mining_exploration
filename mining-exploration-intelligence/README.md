# 🏔 Andean Au-Dominant Transitional System – Exploration Database (v4.0)

## 📌 Overview

This project models a hypothetical intermediate-stage exploration campaign targeting an Au-dominant transitional porphyry–epithermal system in San Juan, Argentina.

The objective is to design a production-grade geological database architecture capable of:

- Representing real-world exploration workflows
- Integrating structural, lithological, alteration, and geochemical data
- Supporting QA/QC and audit-ready standards
- Scaling toward 3D modeling and advanced spatial analysis

This is not an academic mock schema.
It is designed as a scalable, SaaS-ready exploration data backbone.

---

## 🎯 Geological Context

Conceptual model:

- Miocene Andean magmatic arc setting
- Transitional porphyry–epithermal system
- Au-dominant mineralization
- Strong structural control
- Vertical alteration zonation

System architecture:

- Shallow epithermal Au–Ag zone
- Intermediate phyllic halo
- Deeper porphyry Cu–Au core

---

## 🏗 Architecture Philosophy (v4.0)

Core principles:

- Multi-tenant ready
- UUID-based primary keys
- No SERIAL
- numrange for intervals
- EXCLUDE constraints for depth integrity
- PostGIS-native geometry
- Soft delete only for organizational entities
- Explicit separation between physical samples and analytical results
- Structural hierarchy support
- Geological domains

---

## 🧩 Conceptual Schema

Company
 └── Project
      ├── Geological Domains
      └── Drillholes
            ├── Collar (POINTZ, 4326)
            ├── Surveys
            ├── Samples (physical material – numrange)
            │      ├── Assay Results (lab + method + QA/QC)
            │      └── Density
            ├── Lithology Intervals
            ├── Alteration Events
            ├── Mineralization Intervals
            └── Structural System
                   ├── Major Structures
                   ├── Local Structures
                   └── Measurements

---

## 🔬 Geochemical Strategy

Epithermal-dominant indicators:
- Au
- Ag
- As
- Sb
- Pb
- Zn

Porphyry-related indicators:
- Cu
- Mo
- Fe
- S

The schema is optimized to support:

- Pathfinder analysis
- Vectoring interpretation
- Vertical geochemical gradients
- Structural association queries

---

## ⚙ Technical Stack

- PostgreSQL
- PostGIS
- uuid-ossp
- btree_gist
- numrange intervals
- EXCLUDE constraints

CRS default: 4326 (project-configurable)

---

## 📈 Why This Matters

This database is designed to:

- Reflect real Andean exploration systems
- Support audit standards (NI 43-101 / JORC compatible architecture)
- Enable future API integration
- Scale toward 3D block modeling
- Serve as a technical portfolio demonstrating domain + data integration

---

## 🚀 Roadmap

- [x] Multi-tenant base (companies, users, projects)
- [ ] Drillhole core implementation
- [ ] Interval integrity enforcement
- [ ] Geological domain modeling
- [ ] Structural hierarchy implementation
- [ ] Geochemical normalization tools
- [ ] Spatial visualization 

Geological Core Engine – Schema 4.0

Overview

This repository contains the modular database architecture for a multi-tenant geological exploration system.

Designed for:
	•	Intermediate exploration stage
	•	Transitional porphyry–epithermal systems
	•	Gold-dominant environments
	•	Domain-driven geological modeling
	•	Scalable SaaS deployment

Location context (conceptual): San Juan, Argentina.

⸻

Architectural Philosophy

This schema separates:
	•	Physical intervals (Samples)
	•	Analytical data (Assays)
	•	Geological interpretation (Lithology, Alteration, Mineralization)
	•	Structural hierarchy
	•	Domain modeling

The interval is the fundamental geological unit.

No analytical shortcut replaces geological reasoning.

⸻

Core Design Principles
	•	UUID v4 across all entities
	•	PostGIS spatial support
	•	numrange for depth intervals
	•	EXCLUDE constraints to prevent interval overlap
	•	CRS default 4326
	•	Multi-tenant architecture
	•	Modular SQL implementation

⸻

Modular Structure

database/
│
├── 00_extensions.sql
├── 01_multitenant.sql
├── 02_core_drillholes.sql
├── 03_sampling.sql
├── 04_geochemistry.sql
├── 05_geology.sql
├── 06_structural.sql
├── 07_domains.sql
└── 99_indexes.sql

Each module:
	•	Is independently executable
	•	Respects relational hierarchy
	•	Avoids circular dependencies
	•	Preserves geological integrity

⸻

Current Status

Phase 1 – Physical Infrastructure

✔ Extensions
✔ Multi-tenant layer
✔ Drillholes
✔ Collar geometry (POINTZ 4326)
✔ Surveys
✔ Sample intervals with overlap protection

System backbone is established.

⸻

Conceptual Model

Company
└── Project
    ├── Geological_Domains
    └── Drillholes
        ├── Collar
        ├── Surveys
        └── Samples (numrange)
            ├── Assay_Results
            ├── Density
            ├── Lithology_Intervals
            ├── Alteration_Events
            ├── Mineralization_Intervals
            └── Structural_Measurements


⸻

Why Interval-Centric?

In a porphyry–epithermal transitional system:
	•	Assay does not define mineralization
	•	Alteration can occur in multiple events
	•	Structural control may override grade
	•	Geological domains are interpretative layers

Therefore, the physical interval is the anchor of the model.

⸻

Roadmap

Phase 2 – Geochemistry
Phase 3 – Geological interpretation
Phase 4 – Structural hierarchy
Phase 5 – Domain modeling
Phase 6 – Optimization and indexing

⸻

Long-Term Vision

This engine is designed to support:
	•	3D modeling workflows
	•	Geospatial analytics
	•	Predictive modeling
	•	Domain-based resource estimation
	•	Web integration (API + frontend visualization)

## Phase 1 – Relational Exploration Model

This phase implements a normalized relational schema for early-stage gold exploration.

Entities:

- Projects
- Drillholes
- Assays

Design principles:

- Drillholes are uniquely identified.
- Assays are interval-based measurements.
- Depth integrity is enforced via CHECK constraint.
- Gold grade stored in ppm.

Example analytical query:
Average gold grade per drillhole to detect anomalous targets.

## Phase 2 – Spatial Drillhole Model

Enhancements:
- Added PostGIS extension
- Introduced spatial geometry for drillhole collars
- Implemented GiST spatial index
- Enabled distance calculations in projected CRS

Key Concept:
Coordinates stored in WGS84 (EPSG:4326)
Distance calculations performed in UTM (EPSG:32719) for metric accuracy.


# Geological Data Platform – Drillhole Management System

Professional multi-tenant geological database architecture built with PostgreSQL and PostGIS.

This project evolved from a simple relational exploration model into a scalable SaaS-ready geological data platform designed to support real-world exploration workflows and future analytical integrations.

---

## 🏗 Architecture Overview

The system is structured in modular blocks to ensure scalability and auditability.

### Block 1 – Multi-Tenant Foundation
- Companies
- Users
- Company-Users relationship
- Projects

Supports:
- Multi-company isolation
- SaaS scalability
- Future role-based access control
- Soft-delete strategy for organizational entities

---

### Block 2 – Core Physical Drillhole Model

Separates logical identity from physical geometry:

Project  
└── Drillhole  
  ├── Collar (POINTZ, EPSG:4326)  
  └── Surveys (deviation control)

Design principles:
- UUID primary keys (no SERIAL)
- One collar per drillhole
- Depth-based deviation records
- Geometry stored in WGS84 (EPSG:4326)
- Prepared for 3D reconstruction

---

## 🧪 Upcoming Blocks

### Block 3 – Sampling Model
- Samples stored as physical material intervals (numrange)
- Overlap prevention using EXCLUDE constraints

### Block 4 – Analytical Results
- Assay results separated from samples
- Lab and analytical method normalization
- QA/QC integration from design stage
- Multi-assay support (re-assay, duplicates, standards)

### Block 5 – Geological & Structural Data
- Lithology intervals
- Structural measurements
- Alteration modeling

---

## ⚙️ Technical Stack

- PostgreSQL
- PostGIS
- uuid-ossp extension
- btree_gist extension
- Advanced SQL constraints (CHECK, UNIQUE, EXCLUDE)
- Spatial indexing (GiST)

---

## 🎯 Design Philosophy

- Enterprise-ready architecture from day one
- No technical debt migration later
- Compatible with NI 43-101 / JORC workflows
- Prepared for:
  - API integration (FastAPI)
  - Geospatial analytics (GeoPandas)
  - Block modeling extensions
  - Machine learning pipelines

---

## 📍 Spatial Strategy

- Coordinates stored in EPSG:4326 (WGS84)
- Projected CRS transformations applied for metric calculations when needed
- Geometry stored separately from drillhole identity

---

## 🚀 Long-Term Vision

To build a scalable geological data backbone capable of supporting:

- Exploration management
- QA/QC auditing
- Spatial analysis
- 3D reconstruction
- Resource modeling pipelines
 

🏔 Andean Au-Dominant Transitional System – Exploration Database (v4.0)

📌 Overview

This project models a hypothetical intermediate-stage exploration campaign targeting an Au-dominant transitional porphyry–epithermal system in the Cordillera Frontal of San Juan.

The objective is to design a production-grade geological database architecture capable of:
	•	Representing real-world exploration workflows
	•	Integrating structural, lithological, alteration, and geochemical data
	•	Supporting QA/QC and audit-ready standards
	•	Scaling toward 3D modeling and advanced spatial analysis

This is not an academic mock schema.
It is designed as a scalable, SaaS-ready exploration data backbone.

⸻

🎯 Geological Context

The conceptual model represents:
	•	Miocene Andean magmatic arc setting
	•	Transitional porphyry–epithermal system
	•	Au-dominant mineralization
	•	Strong structural control
	•	Vertical alteration zonation

System architecture:
	•	Shallow epithermal Au–Ag zone
	•	Intermediate phyllic halo
	•	Deeper porphyry Cu–Au core

⸻

🏗 Architecture Philosophy (v4.0)

Version 4.0 evolves from generic drillhole modeling to explicit geological system modeling.

Core principles:
	•	Multi-tenant ready
	•	UUID-based primary keys
	•	No SERIAL
	•	numrange for intervals
	•	EXCLUDE constraints for depth integrity
	•	PostGIS-native geometry
	•	Soft delete only for organizational entities
	•	Explicit separation between physical samples and analytical results
	•	Structural hierarchy support
	•	Geological domains

⸻

🧩 Conceptual Schema

Company
└── Project
    ├── Geological Domains
    └── Drillholes
        ├── Collar (POINTZ, 4326)
        ├── Surveys
        ├── Samples (physical material – numrange)
        │    ├── Assay Results (lab + method + QA/QC)
        │    └── Density
        ├── Lithology Intervals
        ├── Alteration Events (with overprint logic)
        ├── Mineralization Intervals
        └── Structural System
            ├── Major Structures
            ├── Local Structures
            └── Measurements

⸻

🔬 Geochemical Strategy

Element sets are system-driven, not arbitrary.

Epithermal-dominant indicators:
	•	Au
	•	Ag
	•	As
	•	Sb
	•	Pb
	•	Zn

Porphyry-related indicators:
	•	Cu
	•	Mo
	•	Fe
	•	S

The schema is optimized to support:
	•	Pathfinders
	•	Vectoring analysis
	•	Vertical geochemical gradients
	•	Structural association queries

⸻

⚙ Technical Stack
	•	PostgreSQL
	•	PostGIS
	•	uuid-ossp
	•	btree_gist
	•	numrange intervals
	•	EXCLUDE constraints

CRS default: 4326 (project-configurable)

⸻

📈 Why This Matters

This database is designed to:
	•	Reflect real Andean exploration systems
	•	Support audit standards (NI 43-101 / JORC compatible architecture)
	•	Enable future API integration
	•	Scale toward 3D block modeling

⸻

🚀 Roadmap
	•	Multi-tenant base (companies, users, projects)
	•	Drillhole core implementation
	•	Interval integrity enforcement
	•	Geological domain modeling
	•	Structural hierarchy implementation
	•	Geochemical normalization tools
	•	Spatial visualization integration
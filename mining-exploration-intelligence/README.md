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


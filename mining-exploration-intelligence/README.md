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
- [ ] Spatial visualization integration

EOF
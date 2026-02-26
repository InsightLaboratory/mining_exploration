Andean Au-Dominant Transitional System – Exploration Database (v4.0)
Overview

This project models a production-grade exploration database designed for an intermediate-stage Au-dominant transitional porphyry–epithermal system.

Conceptual location: San Juan, Argentina.

It is not an academic schema.

It is engineered to support real exploration workflows with scalability toward SaaS deployment and 3D geological modeling.

Geological Context

Conceptual model:

Miocene Andean magmatic arc setting

Transitional porphyry–epithermal system

Gold-dominant mineralization

Strong structural control

Vertical alteration zonation

System architecture:

Shallow epithermal Au–Ag zone

Intermediate phyllic halo

Deeper porphyry Cu–Au core

Architectural Philosophy (v4.0)

Core principles:

Multi-tenant ready

UUID primary keys

No SERIAL

numrange for depth intervals

EXCLUDE constraints for interval integrity

PostGIS-native geometry

Soft deletes for organizational entities

Clear separation between physical samples and analytical data

Explicit structural hierarchy

Geological domain modeling

Technical Stack

PostgreSQL

PostGIS

uuid-ossp

btree_gist

numrange

EXCLUDE constraints

Default CRS: 4326 (project configurable)

Conceptual Schema

        

    Company
        └── Project 
               ├── Gological Domains
               └── Drillholes
                       ├──Collar (POINTZ)
                       ├──Surveys
                       └──Samples (numrange)
                             ├── Assay Results
                             ├── Density
                             ├── Lithology Intervals
                             ├── Alteration Events
                             ├── Mineralization Intervals
                             └──Structural Measurements

                             
Geochemical Strategy
Epithermal Indicators

Au

Ag

As

Sb

Pb

Zn

Porphyry Indicators

Cu

Mo

Fe

S

Supports:

Pathfinder analysis

Vectoring interpretation

Vertical geochemical gradients

Structural association queries

Why Interval-Centric?

In transitional systems:

Assays do not define mineralization

Alteration occurs in multiple events

Structural control dominates geometry

Domains are interpretative layers

👉 The physical interval is the fundamental geological unit.

Roadmap

Phase 1 – Physical Infrastructure
Phase 2 – Geochemistry
Phase 3 – Geological Interpretation
Phase 4 – Structural Hierarchy
Phase 5 – Domain Modeling
Phase 6 – Optimization & Indexing

Long-Term Vision

This engine supports:

3D modeling workflows

Geospatial analytics

Predictive modeling

Domain-based resource estimation

API integration

Frontend visualization

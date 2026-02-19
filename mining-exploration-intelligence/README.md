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

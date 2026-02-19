INSERT INTO projects (name, location, start_date)
VALUES ('Andes Gold Target', 'Argentina', '2025-01-10');

INSERT INTO drillholes (
    project_id,
    hole_id,
    collar_elevation,
    azimuth,
    dip,
    total_depth,
    drilling_type,
    status,
    geom
)
VALUES
(1, 'DH001', 3200, 45, -60, 120, 'diamond', 'completed',
 ST_SetSRID(ST_MakePoint(-69.123, -30.456), 4326)),

(1, 'DH002', 3220, 90, -70, 150, 'diamond', 'completed',
 ST_SetSRID(ST_MakePoint(-69.125, -30.458), 4326)),

(1, 'DH003', 3180, 120, -55, 100, 'reverse_circulation', 'completed',
 ST_SetSRID(ST_MakePoint(-69.121, -30.455), 4326));


INSERT INTO assays (drillhole_id, from_m, to_m, au_ppm)
VALUES
(1, 0, 20, 0.5),
(1, 20, 40, 1.2),
(1, 40, 60, 2.5),
(2, 0, 30, 0.8),
(2, 30, 60, 1.8),
(3, 0, 25, 0.4),
(3, 25, 50, 3.1);

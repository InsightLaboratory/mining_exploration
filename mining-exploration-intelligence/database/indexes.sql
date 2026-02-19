CREATE INDEX idx_drillholes_geom
ON drillholes
USING GIST (geom);

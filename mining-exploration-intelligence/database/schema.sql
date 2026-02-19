CREATE EXTENSION IF NOT EXISTS postgis;


CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT,
    start_date DATE
);

CREATE TABLE drillholes (
    id SERIAL PRIMARY KEY,
    project_id INT NOT NULL REFERENCES projects(id),
    hole_id TEXT NOT NULL UNIQUE,

    collar_elevation NUMERIC,      -- Elevación en metros
    azimuth NUMERIC CHECK (azimuth BETWEEN 0 AND 360),
    dip NUMERIC CHECK (dip BETWEEN -90 AND 0),
    total_depth NUMERIC CHECK (total_depth > 0),

    drilling_type TEXT CHECK (
        drilling_type IN ('diamond', 'reverse_circulation')
    ),

    status TEXT CHECK (
        status IN ('planned', 'completed', 'abandoned')
    ),

    geom GEOMETRY(POINT, 4326) NOT NULL
);


CREATE TABLE assays (
    id SERIAL PRIMARY KEY,
    drillhole_id INT REFERENCES drillholes(id),
    from_m NUMERIC NOT NULL,
    to_m NUMERIC NOT NULL,
    au_ppm NUMERIC NOT NULL,
    CHECK (to_m > from_m)
);

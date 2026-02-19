SELECT
    d1.hole_id,
    d2.hole_id,
    ST_Distance(
        ST_Transform(d1.geom, 32719),
        ST_Transform(d2.geom, 32719)
    ) AS distance_meters
FROM drillholes d1
JOIN drillholes d2 ON d1.id < d2.id;

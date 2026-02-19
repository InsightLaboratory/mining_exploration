-- =============================================
-- Average gold grade per drillhole
-- Purpose: Identify anomalous drillholes
-- =============================================

SELECT
    d.hole_id,
    ROUND(AVG(a.au_ppm), 2) AS avg_grade_ppm
FROM drillholes d
JOIN assays a ON d.id = a.drillhole_id
GROUP BY d.hole_id
ORDER BY avg_grade_ppm DESC;

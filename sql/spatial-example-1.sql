SELECT
	ST_Area(geom)
FROM
	nyc_neighborhoods
WHERE
	name = 'West Village';
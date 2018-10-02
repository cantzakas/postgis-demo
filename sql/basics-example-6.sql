SELECT
	ST_AsText(geom)
FROM
	nyc_streets
WHERE
	name = 'Atlantic Commons';
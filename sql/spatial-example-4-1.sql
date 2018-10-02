SELECT
	name,
	ST_AsText(geom)
FROM
	nyc_subway_stations
WHERE
	name = 'Broad St';
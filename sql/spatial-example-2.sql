SELECT
	SUM(ST_Length(geom)) / 1000 AS length
FROM
	nyc_streets;
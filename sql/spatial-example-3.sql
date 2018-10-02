SELECT
	type, 
	SUM(ST_Length(geom)) AS length
FROM
	nyc_streets
GROUP BY
	type
ORDER BY
	length DESC;
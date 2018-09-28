SELECT
	str1.name,
	ST_AsGeoJSON(ST_Transform(str1.geom,4326)) AS geojson
FROM
	nyc_streets str1, 
	nyc_streets str2
WHERE 
	str2.name = 'Atlantic Commons'
	AND ST_DWithin(
		str1.geom,
		str2.geom, 
		0.1)

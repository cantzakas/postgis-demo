SELECT
	SUM(popn_black) AS sum_popn_black, 
	ST_AsGeoJSON(ST_Transform(ST_UNION(census.geom), 4326)) AS geojson
FROM nyc_streets AS str,
	nyc_census_blocks AS census
WHERE
	str.name = 'Atlantic Commons'
	AND ST_DWithin(
		str.geom,
		census.geom,
		50);

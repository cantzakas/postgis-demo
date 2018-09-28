SELECT
	neighborhoods.name AS neighborhood_name,
	ST_AsGeoJSON(ST_Transform(ST_UNION(neighborhoods.geom), 4326)) AS geojson,
	(100.0 * SUM(popn_white) / SUM(popn_total))::DECIMAL(5,2) AS pcnt_white,
	(100.0 * SUM(popn_black) / SUM(popn_total))::DECIMAL(5,2) AS pcnt_black,
	SUM(census.popn_total) AS sum_popn_total
FROM
	nyc_neighborhoods AS neighborhoods
	JOIN nyc_census_blocks AS census
		ON ST_Intersects(
			neighborhoods.geom,
			census.geom)
WHERE
	neighborhoods.boroname = 'Manhattan'
GROUP BY
	neighborhoods.name
ORDER BY
	pcnt_white DESC

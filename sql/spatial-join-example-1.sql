SELECT
	subways.name AS subway_name,
	ST_AsGeoJSON(ST_Transform(subways.geom, 4326)) AS subway_geom,
	neighborhoods.name AS neighborhood_name,
	ST_AsGeoJSON(ST_Transform(neighborhoods.geom, 4326)) AS neighborhood_geom
FROM
	nyc_neighborhoods AS neighborhoods
	JOIN nyc_subway_stations AS subways
		ON ST_Contains(
			neighborhoods.geom, 
			subways.geom)
WHERE
	subways.name = 'Broad St';
SELECT
	bo.boroname AS bo_name, 
	ST_AsGeoJSON(ST_Transform(ST_UNION(bo.geom), 4326)) AS bo_geom,
	nb.name AS nb_name, 
	ST_AsGeoJSON(ST_Transform(ST_UNION(nb.geom), 4326)) AS nb_geom,
	str.name::TEXT AS str_name,    
	ST_AsGeoJSON(ST_Transform(str.geom, 4326)) AS str_geom
FROM
	nyc_neighborhoods bo
	LEFT OUTER JOIN nyc_neighborhoods nb
		ON bo.boroname = nb.boroname
	JOIN nyc_streets str
		ON ST_Intersects(
			nb.geom,
			str.geom)
WHERE
	str.name = 'Atlantic Commons'
GROUP BY
	bo.boroname, 
	nb_name,
	str_name, 
	str_geom
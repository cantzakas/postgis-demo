SELECT
	str.name,
	ST_AsGeoJSON(ST_Transform(str.geom, 4326)) AS geom
FROM
	nyc_streets str
	JOIN nyc_subway_stations sta
		ON ST_DWithin(
			str.geom, 
			sta.geom, 
			10)
WHERE
	sta.name = 'Broad St';
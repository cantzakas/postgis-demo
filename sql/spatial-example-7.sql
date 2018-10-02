SELECT
	nb.name || ', ' || nb.boroname AS name
FROM
	nyc_neighborhoods nb
WHERE
	ST_Intersects(
		nb.geom, 
		ST_GeomFromText('MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701))',26918) -- geometric representation of 'Atlantic Commons' street
	);
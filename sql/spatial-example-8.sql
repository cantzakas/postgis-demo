SELECT
	str.name
FROM
	nyc_streets str
WHERE
	ST_DWithin(
		str.geom, 
		ST_GeomFromText('MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701))',26918), -- geometric representation of 'Atlantic Commons' street
		0.1);
SELECT
	SUM(census.popn_total)
	FROM
		nyc_census_blocks census
	WHERE
		ST_DWithin(
			census.geom, 
			ST_GeomFromText('MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701))',26918), -- geometric representation of 'Atlantic Commons' street
			50);
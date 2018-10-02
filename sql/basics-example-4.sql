SELECT 
	SUM(popn_total) AS population
FROM
	nyc_census_blocks
WHERE
	boroname = 'The Bronx';
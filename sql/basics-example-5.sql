SELECT
	boroname,
	100 * Sum(popn_white)/Sum(popn_total) AS white_pct
FROM
	nyc_census_blocks
GROUP BY
	boroname;
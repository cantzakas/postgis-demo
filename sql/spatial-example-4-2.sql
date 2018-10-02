SELECT
	name || ', ' || boroname AS name
FROM
	nyc_neighborhoods
WHERE
	ST_Intersects(
		geom, 
		ST_GeomFromText('POINT(583571.905921312 4506714.34119218)',26918) -- geometric representation of 'Brad Street subway station');
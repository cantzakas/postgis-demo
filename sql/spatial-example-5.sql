SELECT
	str.name
FROM
	nyc_streets str
WHERE
	ST_DWithin(
		str.geom, 
		ST_GeomFromText('POINT(583571.905921312 4506714.34119218)',26918), -- geometric representation of 'Brad Street subway station'
		10);
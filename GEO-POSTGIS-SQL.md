# Geometry/PostGIS Exercises

Here’s a reminder of some commonly used PostGIS functions; they should be useful for the exercises to come later.

| Function | Description |
| ---      | --- |
| ST_GeometryType(geometry) | returns the type of the geometry |
| ST_NDims(geometry) | returns the number of dimensions of the geometry |
| ST_SRID(geometry) | returns the spatial reference identifier number of the geometry |
| ST_X(point) | returns the X ordinate |
| ST_Y(point) | returns the Y ordinate |
| ST_Length(linestring) | returns the length of the linestring |
| ST_StartPoint(geometry) | returns the first coordinate as a point |
| ST_EndPoint(geometry) | returns the last coordinate as a point |
| ST_NPoints(geometry) | returns the number of coordinates in the linestring |
| ST_Area(geometry) | returns the area of the polygons |
| ST_NRings(geometry) | returns the number of rings (usually 1, more if there are holes) |
| ST_ExteriorRing(polygon) | returns the outer ring as a linestring |
| ST_InteriorRingN(polygon, integer) | returns a specified interior ring as a linestring |
| ST_Perimeter(geometry) | returns the length of all the rings |
| ST_NumGeometries(multi/geomcollection) | returns the number of parts in the collection |
| ST_GeometryN(geometry, integer) | returns the specified part of the collection |
| ST_GeomFromText(text) | returns geometry |
| ST_AsText(geometry) | returns WKT text |
| ST_AsEWKT(geometry) | returns EWKT text |
| ST_GeomFromWKB(bytea) | returns geometry |
| ST_AsBinary(geometry) | returns WKB bytea |
| ST_AsEWKB(geometry) | returns EWKB bytea |
| ST_GeomFromGML(text) | returns geometry |
| ST_AsGML(geometry) | returns GML text |
| ST_GeomFromKML(text) | returns geometry |
| ST_AsKML(geometry) | returns KML text |
| ST_AsGeoJSON(geometry) | returns JSON text |
| ST_AsSVG(geometry) | returns SVG text |

Also remember the tables we have available:

| Table Name | Table Attributes |
| ---      | --- |
| nyc_census_blocks | blkid, popn_total, boroname, geom |
| nyc_streets | name, type, geom |
| nyc_subway_stations | name, geom |
| nyc_neighborhoods | name, boroname, geom |

## Exercises
- **“What is the area of the ‘West Village’ neighborhood?”**
```sql
SELECT ST_Area(geom)
FROM nyc_neighborhoods
WHERE name = 'West Village';
```

| population |
| :---    |
| 1385108 |
| (1 row) |

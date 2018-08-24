---
pageTitle: PostGIS
---

# Purpose
The purpose of this lab is to get a basic understanding of working with
geospatial data in Greenplum, namely with PostGIS.

Geospatial is a great tool for finding relationships between places. PostGIS is
a spatial database extender for PostgreSQL object-relational database. It adds
support for geographic objects allowing location queries to be run in SQL.

In addition to basic location awareness, PostGIS offers many features rarely
found in other competing spatial databases such as Oracle Locator/Spatial and
SQL Server.

# Before Starting This Lab Exercise
This lab requires that you're logged into the Greenplum Master Server (`mdw`)
as `gpadmin`. You will also need to ensure that you have PostGIS installed and
running in your lab environment.

We will be working primarily with the NYC dataset in this lab. There are 5
total shapefiles we will be working with:

* nyc_census_blocks.shp

* nyc_streets.shp

* nyc_neighborhoods.shp

* nyc_subway_stations.shp

* nyc_homicides.shp

NOTE: When ingesting the shapefiles, modify the last line of the sql file after
creation (the one with CREATE INDEX). It contains a syntax error where you need
to specify the index name!

NOTE: If some/all of your tables don’t have an SRID of 26918, you can update
like so:

```SQL
SELECT UpdateGeometrySRID(‘nyc_neighborhoods’,’geom’,26918);
```

1. First, let's create our geometries

```SQL
CREATE TABLE geometries (name varchar, geom geometry);
```
```SQL
INSERT INTO geometries VALUES
('Point', 'POINT(0 0)'),
('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),
(1 1, 1 2, 2 2, 2 1, 1 1))'),
('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),
POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');
```
```SQL
SELECT name, ST_AsText(geom) FROM geometries;
```

The above example CREATEs a table (geometries) then INSERTs five geometries: a
point, a line, a polygon, a polygon with a hole, and a collection. Finally, the
inserted rows are SELECTed and displayed in the output.

SELECT * FROM geometry_columns;

* f\_table\_catalog, f\_table\_schema, and f\_table\_name provide the fully
qualified name of the feature table containing a given geometry. Because
PostgreSQL doesn’t make use of catalogs, f\_table\_catalog will tend to be
empty.

* f\_geometry\_column is the name of the column that geometry containing column.
For feature tables with multiple geometry columns, there will be one record for
each.

* coord\_dimension and srid define the the dimension of the geometry (2-, 3-,
  or 4-dimensional) and the Spatial Reference system identifier that refers to
  the spatial_ref_sys table respectively.

* The type column defines the type of geometry as described below; we’ve seen
Point and Linestring types so far.

By querying this table, GIS clients and libraries can determine what to expect
when retrieving data and can perform any necessary projection, processing or
rendering without needing to inspect each individual geometry.

A **spatial point** represents a single location on the Earth. This point is
represented by a single coordinate (including either 2-, 3-, or 4-dimensions).
Points are used to represent objects when the exact details, such as shape and
size, are not important at the target scale. For example, cities on a map of
the world can be described as points, while a map of a single state might
represent cities as polygons.

**Example Point:**

```SQL
SELECT name, ST_AsText(geom) FROM nyc_subway_stations LIMIT 1;
```

A linestring is a path between locations. It takes the form of an ordered
series of two or more points. Roads and rivers are typically represented as
linestrings.

**Example Linestring:**

```SQL
SELECT ST_AsText(geom) FROM geometries WHERE name = 'Linestring';
```
```SQL
SELECT ST_Length(geom) FROM geometries WHERE name = 'Linestring'; -- returns length
```
A **polygon** is a representation of an area. The outer boundary of the polygon
is represented by a ring. Holes in the polygon are also represented by rings.

Polygons are used to represent objects whose size and shape are important.

**Example Polygon:**

```SQL
SELECT name, ST_Area(geom) FROM geometries WHERE name LIKE 'Polygon%'; -- area
```

There are four collection types, which group multiple simple geometries into
sets.

* MultiPoint, a collection of points

* MultiLineString, a collection of linestrings

* MultiPolygon, a collection of polygons

* GeometryCollection, a heterogeneous collection of any geometry (including
  other collections)

Collections are another concept that shows up in GIS software more than in
generic graphics software. They are useful for directly modeling real world
objects as spatial objects. For example, how to model a lot that is split by a
right-of-way? As a MultiPolygon, with a part on either side of the right-of-way.

**Example Collection:**

```SQL
SELECT name, ST_AsText(geom) FROM geometries WHERE name = 'Collection';
```

**Operations on a collection**

**ST_NumGeometries(geometry)** - returns the number of parts in the collection

**ST_GeometryN(geometry,n)** - returns the specified part

**ST_Area(geometry)** - returns the total area of all polygonal parts

**ST_Length(geometry)** - returns the total length of all linear parts

**Exercise Set #1**

1. "What is the area of the ‘West Village’ neighborhood?"

```SQL
SELECT ST_Area(geom)
FROM nyc_neighborhoods
WHERE name = 'West Village';
```

1. "How many census blocks in New York City have a hole in them?"
```SQL
SELECT Sum(ST_Area(geom)) / 4047
FROM nyc_neighborhoods
WHERE boroname = 'Manhattan';
```
**NOTE:** 4047 sq. meters to an acre

1. "What is the total length of streets (in kilometers) in New York City?"
```SQL
SELECT Sum(ST_Length(geom)) / 1000
FROM nyc_streets;
```

1. "What is the length of streets in New York City, summarized by type?"
```SQL
SELECT type, Sum(ST_Length(geom)) AS length
FROM nyc_streets
GROUP BY type
ORDER BY length DESC;
```
#  Section 2: Spatial Geometries/Relationships

Spatial databases are powerful because they not only store geometry, they also
have the ability to compare relationships between geometries.

Questions like "Which are the closest bike racks to a park?" or “Where are the
intersections of subway lines and streets?” can only be answered by comparing
geometries representing the bike racks, streets, and subway lines.

**ST_Intersects, ST_Crosses, and ST_Overlaps test whether the interiors of the
geometries intersect.**

**ST_Intersects** - returns t (TRUE) if the two shapes have any space in common,
i.e., if their boundaries or interiors intersect.

**ST_Disjoint** - The opposite of ST_Intersects. If two geometries are disjoint,
they do not intersect, and vice-versa. In fact, it is often more efficient to
test “not intersects” than to test “disjoint” because the intersects tests can
be spatially indexed, while the disjoint test cannot.

**ST_Crosses** - For multipoint/polygon, multipoint/linestring,
linestring/linestring, linestring/polygon, and linestring/multipolygon
comparisons, ST_Crosses(geometry A, geometry B) returns t (TRUE) if the
intersection results in a geometry whose dimension is one less than the maximum
dimension of the two source geometries and the intersection set is interior to
both source geometries.

**ST_Overlaps** - compares two geometries of the same dimension and returns TRUE
if their intersection set results in a geometry different from both but of the
same dimension.

**ST_Touches** - returns TRUE if either of the geometries’ boundaries intersect
or if only one of the geometry’s interiors intersects the other’s boundary.

**ST_Within/ST_Contains** - Tests whether one geometry is fully within the other.

**Example: Let’s take our Broad Street subway station and determine its
neighborhood using the ST_Intersects function**

```SQL
SELECT name, ST_AsText(geom)
FROM nyc_subway_stations
WHERE name = 'Broad St';
```

Using This:

```SQL
SELECT name, boroname
FROM nyc_neighborhoods
WHERE ST_Intersects(geom, ST_GeomFromText('POINT(583571 4506714)',26918));
```

We should get the Financial District in Manhattan!

**An extremely common GIS question is "find all the stuff within distance X of
this other stuff".**

The **ST_Distance** function calculates the shortest distance between
two geometries and returns it as a float. This is useful for actually reporting
back the distance between objects.

For testing whether two objects are within a distance of one another, the
**ST_DWithin** function provides an index-accelerated true/false test. This is
useful for questions like “how many X are within N meters of Z?”. You don’t have
to calculate an actual buffer, you just have to test the distance relationship.

**Example: Using our Broad Street subway station again, we can find the streets
nearby (within 10 meters of) the subway stop:**

```SQL
SELECT name
FROM nyc_streets
WHERE ST_DWithin( geom, ST_GeomFromText('POINT(583571 4506714)',26918), 10);
```

**Exercise Set #2**
1. What is the geometric representation of Atlantic Commons?
```SQL
SELECT ST_AsText(geom)
FROM nyc_streets
WHERE name = 'Atlantic Commons';
```

1. What neighborhood and borough is Atlantic Commons in?

```SQL
SELECT name, boroname
FROM nyc_neighborhoods
WHERE ST_Intersects(
  geom,
  ST_GeomFromText('LINESTRING(586782 4504202,586864 4504216)', 26918)
);
```

1. What streets does Atlantic Commons join with?
```SQL
SELECT name
FROM nyc_streets
WHERE ST_DWithin(
  geom,
  ST_GeomFromText('LINESTRING(586782 4504202,586864 4504216)', 26918),
  0.1
);
```

1. Approximately how many people live on (within 50 meters of) Atlantic Commons?
```SQL
SELECT Sum(popn_total)
FROM nyc_census_blocks
WHERE ST_DWithin(
   geom,
   ST_GeomFromText('LINESTRING(586782 4504202,586864 4504216)', 26918),
   50
  );
```

# Section 3: Spatial Joins
Spatial joins allow you to combine information from different tables by using
spatial relationships as the join key. Much of what we think of as “standard GIS
analysis” can be expressed as spatial joins.

In the previous section, we explored spatial relationships using a 2-step
process: first we extracted a subway station point for ‘Broad St’; then, we used
that point to ask further questions such as “what neighborhood is the ‘Broad St’
station in?”

Using a spatial join, we can answer the question in one step, retrieving
information about the subway station and the neighborhood that contains it:

```SQL
SELECT
  subways.name AS subway_name,
  neighborhoods.name AS neighborhood_name,
  neighborhoods.boroname AS borough
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_subway_stations AS subways
ON ST_Contains(neighborhoods.geom, subways.geom)
WHERE subways.name = 'Broad St';
```

**NOTE:** Any function that provides a true/false relationship between two
tables can be used to drive a spatial join, but the most commonly used ones are:
ST_Intersects, ST_Contains, and ST_DWithin.

The combination of a JOIN with a GROUP BY provides the kind of analysis that is
usually done in a GIS system.

**Example:** “What is the population and racial make-up of the neighborhoods of
Manhattan?” Here we have a question that combines information from about
population from the census with the boundaries of neighborhoods, with a
restriction to just one borough of Manhattan.

```SQL
SELECT
  neighborhoods.name AS neighborhood_name,
  Sum(census.popn_total) AS population,
  100.0 * Sum(census.popn_white) / Sum(census.popn_total) AS white_pct,
  100.0 * Sum(census.popn_black) / Sum(census.popn_total) AS black_pct
FROM nyc_neighborhoods AS neighborhoods
JOIN nyc_census_blocks AS census
ON ST_Intersects(neighborhoods.geom, census.geom)
WHERE neighborhoods.boroname = 'Manhattan'
GROUP BY neighborhoods.name
ORDER BY white_pct DESC;
```

Essentially, the following happens on this query:
1. The JOIN clause creates a virtual table that includes columns from both the
neighborhoods and census tables.
1. The WHERE clause filters our virtual table to just rows in Manhattan.
1. The remaining rows are grouped by the neighborhood name and fed through the
aggregation function to Sum() the population values.
1. After a little SQL arithmetic (e.g., GROUP BY, ORDER BY) on the final
numbers, our query spits out the percentages.

We can also use distance tests as a join key, to create summarized “all items
within a radius” queries. Let’s explore the racial geography of New York using
distance queries.

First, let’s get the baseline racial make-up of the city.
```SQL
SELECT
  100.0 * Sum(popn_white) / Sum(popn_total) AS white_pct,
  100.0 * Sum(popn_black) / Sum(popn_total) AS black_pct,
  Sum(popn_total) AS popn_total
FROM nyc_census_blocks;
```

We see that of the ~8M people in NYC, ~44% are white and ~26% are black.

Duke Ellington once sang that “You / must take the A-train / To / go to Sugar
Hill way up in Harlem.” As we saw earlier, Harlem has far and away the highest
African-American population in Manhattan (80.5%). Is the same true of Duke’s
A-train?

To find the A-train, we will want any row in routes that has an ‘A’ in it. We
can do this a number of ways, but today we will use the fact that
strpos(routes,’A’) will return a non-zero number only if ‘A’ is in the routes
field.

```SQL
SELECT DISTINCT routes
FROM nyc_subway_stations AS subways
WHERE strpos(subways.routes,'A') > 0;
```

Now let’s summarize the racial make-up of within 200 meters of the A-train line.

```SQL
SELECT
  100.0 * Sum(popn_white) / Sum(popn_total) AS white_pct,
  100.0 * Sum(popn_black) / Sum(popn_total) AS black_pct,
  Sum(popn_total) AS popn_total
FROM nyc_census_blocks AS census
JOIN nyc_subway_stations AS subways
ON ST_DWithin(census.geom, subways.geom, 200)
WHERE strpos(subways.routes,'A') > 0;
```

In the last section we saw that the A-train didn’t serve a population that
differed much from the racial make-up of the rest of the city. Are there any
trains that have a non-average racial make-up?

To answer that question, we’ll add another join to our query, so that we can
simultaneously calculate the make-up of many subway lines at once. To do that,
we’ll need to create a new table that enumerates all the lines we want to
summarize.

```SQL
CREATE TABLE subway_lines ( route char(1) );
INSERT INTO subway_lines (route) VALUES
  ('A'),('B'),('C'),('D'),('E'),('F'),('G'),
  ('J'),('L'),('M'),('N'),('Q'),('R'),('S'),
  ('Z'),('1'),('2'),('3'),('4'),('5'),('6'),
  ('7');
```

```SQL
SELECT
  lines.route,
  100.0 * Sum(popn_white) / Sum(popn_total) AS white_pct,
  100.0 * Sum(popn_black) / Sum(popn_total) AS black_pct,
  Sum(popn_total) AS popn_total
FROM nyc_census_blocks AS census
JOIN nyc_subway_stations AS subways
ON ST_DWithin(census.geom, subways.geom, 200)
JOIN subway_lines AS lines
ON strpos(subways.routes, lines.route) > 0
GROUP BY lines.route
ORDER BY black_pct DESC, white_pct DESC;
```

As before, the joins create a virtual table of all the possible combinations
available within the constraints of the JOIN ON restrictions, and those rows
are then fed into a GROUP summary. The spatial magic is in the ST_DWithin
function, that ensures only census blocks close to the appropriate subway
stations are included in the calculation.

**Exercise Set #3: Spatial Joins**
1. What subway station is in ‘Little Italy’? What subway route is it on?
```SQL
SELECT s.name, s.routes
FROM nyc_subway_stations AS s
JOIN nyc_neighborhoods AS n
ON ST_Contains(n.geom, s.geom)
WHERE n.name = 'Little Italy';
```

1. What are all the neighborhoods served by the 6-train?
```SQL
SELECT DISTINCT n.name, n.boroname
FROM nyc_subway_stations AS s
JOIN nyc_neighborhoods AS n
ON ST_Contains(n.geom, s.geom)
WHERE strpos(s.routes,'6') > 0;
```

1. What are the population density (people / km^2) of the ‘Upper West Side’ and
‘Upper East Side’?
**NOTE: There are 1,000,000 sq. meters in 1 sq. kilometer**

```SQL
SELECT
  n.name,
  Sum(c.popn_total) / (ST_Area(n.geom) / 1000000.0) AS popn_per_sqkm
FROM nyc_census_blocks AS c
JOIN nyc_neighborhoods AS n
ON ST_Intersects(c.geom, n.geom)
WHERE n.name = 'Upper West Side'
OR n.name = 'Upper East Side'
GROUP BY n.name, n.geom;
```

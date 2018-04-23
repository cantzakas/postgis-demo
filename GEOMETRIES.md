# Geometries
How real world objects are represented within PostGIS/SQL.

## Introduction
Before we start playing with geospatial data, lets have a look at some simple examples. Within the SQL editing environment of your preference, i.e [pgAdmin](https://www.pgadmin.org/), once again select a database in which PostGIS extension has been enables and open the SQL query tool. Paste this example SQL code into the SQL Editor window (removing any text that may be there by default) and then execute.
```sql
CREATE TABLE geometries (name varchar, geom geometry);

INSERT INTO geometries VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');

SELECT name, ST_AsText(geom)
  FROM geometries;
```

The above example CREATEs a table (_geometries_) then INSERTs five geometries: a point, a line, a polygon, a polygon with a hole, and a collection. Finally, the inserted rows are SELECTed and displayed in the Output pane.

| name           | st_astext                                                     |
| :---           | :------------------------------------------------------------ |
|Point           | POINT(0 0)                                                    |
|Polygon         | POLYGON((0 0,1 0,1 1,0 1,0 0))                                |
|PolygonWithHole | POLYGON((0 0,10 0,10 10,0 10,0 0),(1 1,1 2,2 2,2 1,1 1))      |
|Collection      | GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0,1 0,1 1,0 1,0 0))) |
|Linestring      | LINESTRING(0 0,1 1,2 1,2 2)                                   |

## Metadata Tables
In conformance with the Simple Features for SQL (SFSQL) specification, PostGIS provides two tables to track and report on the geometry types available in a given database.
- The first table, _spatial_ref_sys_, defines all the spatial reference systems known to the database and will be described in greater detail later.
- The second table (actually, a view), _geometry_columns_, provides a listing of all “features” (defined as an object with geometric attributes), and the basic details of those features.

Let’s have a look at the geometry_columns table in our database. Paste this command in the Query Tool as before:

```sql
SELECT *
  FROM geometry_columns;
```

By querying this table, GIS clients and libraries can determine what to expect when retrieving data and can perform any necessary projection, processing or rendering without needing to inspect each geometry.

| f_table_catalog | f_table_schema | f_table_name      | f_geometry_column | coord_dimension | srid  | type         |
| :-------------- | :------------- | :---------------- | :---------------- | :-------------- | :---- | :----------- |
| nyc             | public         | nyc_census_blocks | geom              | 2               | 26918 | MULTIPOLYGON |
| nyc             | public         | geometries        | geom              | 2               | 0     | GEOMETRY     |


(_example for illustrative purposes, own result may differ from the one shown here_)

- **f_table_catalog**, **f_table_schema**, and **f_table_name** provide the fully qualified name of the feature table containing a given geometry. Because PostgreSQL doesn’t make use of catalogs, **f_table_catalog** will tend to be empty.
- **f_geometry_column** is the name of the column that geometry containing column – for feature tables with multiple geometry columns, there will be one record for each.
- **coord_dimension** and **srid** define the the dimension of the geometry (2-, 3- or 4-dimensional) and the Spatial Reference system identifier that refers to the **spatial_ref_sys** table respectively.
- The **type** column defines the type of geometry as described below; we’ve seen Point and Linestring types so far.

## Representing Real World Objects
The Simple Features for SQL (SFSQL) specification, the original guiding standard for PostGIS development, defines how a real world object is represented. By taking a continuous shape and digitizing it at a fixed resolution we achieve a passable representation of the object. SFSQL only handled 2-dimensional representations. PostGIS has extended that to include 3- and 4-dimensional representations; more recently the SQL-Multimedia Part 3 (SQL/MM) specification has officially defined their own representation.

Our example table contains a mixture of different geometry types. We can collect general information about each object using functions that read the geometry metadata.

- **ST_GeometryType(geometry)** returns the type of the geometry
- **ST_NDims(geometry)** returns the number of dimensions of the geometry
- **ST_SRID(geometry)** returns the spatial reference identifier number of the geometry

```sql
SELECT name, ST_GeometryType(geom), ST_NDims(geom), ST_SRID(geom)
  FROM geometries;
```

| name            | st_geometrytype       | st_ndims | st_srid |
| :---------------| :---------------------| :--------| :-------|
| Point           | ST_Point              |        2 |       0 |
| Polygon         | ST_Polygon            |        2 |       0 |
| PolygonWithHole | ST_Polygon            |        2 |       0 |
| Collection      | ST_GeometryCollection |        2 |       0 |
| Linestring      | ST_LineString         |        2 |       0 |

### Points
![Image of PostGIS Points - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/points.png)

A spatial point represents a single location on the Earth. This point is represented by a single coordinate (including either 2-, 3- or 4-dimensions). Points are used to represent objects when the exact details, such as shape and size, are not important at the target scale. For example, cities on a map of the world can be described as points, while a map of a single state might represent cities as polygons.

```sql
SELECT ST_AsText(geom)
  FROM geometries
  WHERE name = 'Point';
```
| st_astext  |
| :----------|
| POINT(0 0) |

Some of the specific spatial functions for working with points are:
- **ST_X(geometry)** returns the X ordinate
- **ST_Y(geometry)** returns the Y ordinate
So, we can read the ordinates from a point like this:

```sql
SELECT ST_X(geom), ST_Y(geom)
  FROM geometries
  WHERE name = 'Point';
```

In the dataset provided for this demo, The New York City subway stations (_nyc_subway_stations_) table is a data set represented as points. The following SQL query will return the geometry associated with one point (in the ST_AsText column).
```sql
SELECT name, ST_AsText(geom)
  FROM nyc_subway_stations
  LIMIT 1;
```

### Linestrings
![Image of PostGIS Linestrings - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/lines.png)

A linestring is a path between locations. It takes the form of an ordered series of two or more points. Roads and rivers are typically represented as linestrings. A linestring is said to be closed if it starts and ends on the same point. It is said to be simple if it does not cross or touch itself (except at its endpoints if it is closed). A linestring can be both closed and simple.

The street network for New York (_nyc_streets_) dataset contains details such as name, and type. A single real world street may consist of many linestrings, each representing a segment of road with different attributes.

The following SQL query will return the geometry associated with one linestring (in the _ST_AsText_ column).

```sql
SELECT ST_AsText(geom)
  FROM geometries
  WHERE name = 'Linestring';
```
| st_astext                      |
| :------------------------------|
| LINESTRING(0 0, 1 1, 2 1, 2 2) |

Some of the specific spatial functions for working with linestrings are:
- **ST_Length(geometry)** returns the length of the linestring
- **ST_StartPoint(geometry)** returns the first coordinate as a point
- **ST_EndPoint(geometry)** returns the last coordinate as a point
- **ST_NPoints(geometry)** returns the number of coordinates in the linestring

So, the length of our linestring is:
```sql
SELECT ST_Length(geom)
  FROM geometries
  WHERE name = 'Linestring';
```
| st_length        |
| :----------------|
| 3.41421356237309 |

### Polygons
![Image of PostGIS Polygons - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/polygons.png)

A polygon is a representation of an area. The outer boundary of the polygon is represented by a ring. This ring is a linestring that is both closed and simple as defined above. Holes within the polygon are also represented by rings.

Polygons are used to represent objects whose size and shape are important. City limits, parks, building footprints or bodies of water are all commonly represented as polygons when the scale is sufficiently high to see their area. Roads and rivers can sometimes be represented as polygons.

The following SQL query will return the geometry associated with one linestring (in the ST_AsText column).
```sql
SELECT ST_AsText(geom)
  FROM geometries
  WHERE name LIKE 'Polygon%';
```
| ***Note*** |
| :--------- |
| Rather than using an ``=`` sign in our WHERE clause, we are using the ``LIKE`` operator to carry out a string matching operation. You may be used to the ``*`` symbol as a “glob” for pattern matching, but in SQL the ``%`` symbol is used, along with the ``LIKE`` operator to tell the system to do globbing. |

| st_astext                                                        |
| :----------------------------------------------------------------|
| POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))                               |
| POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1)) |

The first polygon has only one ring. The second one has an interior “hole”. Most graphics systems include the concept of a “polygon”, but GIS systems are relatively unique in allowing polygons to explicitly have holes.

![Image of PostGIS Polygons - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/polygons1.png)

Some of the specific spatial functions for working with polygons are:
- **ST_Area(geometry)** returns the area of the polygons
- **ST_NRings(geometry)** returns the number of rings (usually 1, more of there are holes)
- **ST_ExteriorRing(geometry)** returns the outer ring as a linestring
- **ST_InteriorRingN(geometry,n)** returns a specified interior ring as a linestring
- **ST_Perimeter(geometry)** returns the length of all the rings

We can calculate the area of our polygons using the area function:
```sql
SELECT name, ST_Area(geom)
  FROM geometries
  WHERE name LIKE 'Polygon%';
```
| name            | st_area |
| :---------------| :-------|
| Polygon         | 1       |
| PolygonWithHole | 99      |

| ***Note*** |
| :--------- |
| The polygon with a hole has an area that is the area of the outer shell (a 10x10 square) minus the area of the hole (a 1x1 square). |

### Collections
There are four collection types, which group multiple simple geometries into sets.

- **MultiPoint**, a collection of points
- **MultiLineString**, a collection of linestrings
- **MultiPolygon**, a collection of polygons
- **GeometryCollection**, a heterogeneous collection of any geometry (including other collections)

Collections are another concept that shows up in GIS software more than in generic graphics software. They are useful for directly modeling real world objects as spatial objects. For example, how to model a lot that is split by a right-of-way? As a MultiPolygon, with a part on either side of the right-of-way.

![Image of PostGIS Collections - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/collection2.png)
Our example collection contains a polygon and a point:
```sql
SELECT name, ST_AsText(geom)
  FROM geometries
  WHERE name = 'Collection';
```

| name       | st_astext                                                     |
| :----------| :-------------------------------------------------------------|
| Collection | GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0,1 0,1 1,0 1,0 0))) |

![Image of PostGIS Collections - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/collection.png)

Some of the specific spatial functions for working with collections are:

- **ST_NumGeometries(geometry)** returns the number of parts in the collection
- **ST_GeometryN(geometry,n)** returns the specified part
- **ST_Area(geometry)** returns the total area of all polygonal parts
- **ST_Length(geometry)** returns the total length of all linear parts

## Geometry Input and Output
Within the database, geometries are stored on disk in a format only used by the PostGIS program. In order for external programs to insert and retrieve useful geometries, they need to be converted into a format that other applications can understand. Fortunately, PostGIS supports emitting and consuming geometries in a large number of formats:

### Well-known text (WKT)
- **ST_GeomFromText(text, srid)** returns geometry
- **ST_AsText(geometry)** returns text
- **ST_AsEWKT(geometry)** returns text
### Well-known binary (WKB)
- **ST_GeomFromWKB(bytea)** returns geometry
- **ST_AsBinary(geometry)** returns bytea
- **ST_AsEWKB(geometry)** returns bytea
### Geographic Mark-up Language (GML)
- **ST_GeomFromGML(text)** returns geometry
- **ST_AsGML(geometry)** returns text
### Keyhole Mark-up Language (KML)
- **ST_GeomFromKML(text)** returns geometry
- **ST_AsKML(geometry)** returns text
### GeoJSON
- **ST_AsGeoJSON(geometry)** returns text
### Scalable Vector Graphics (SVG)
- **ST_AsSVG(geometry)** returns text

The most common use of a constructor is to turn a text representation of a geometry into an internal representation.

Note that in addition to a text parameter with a geometry representation, we also have a numeric parameter providing the SRID of the geometry.

The following SQL query shows an example of WKB representation (the call to encode() is required to convert the binary output into an ASCII form for printing):


```sql
SELECT encode(
  ST_AsBinary(ST_GeometryFromText('LINESTRING(0 0,1 0)')),
  'hex');
```
| encode                                                                             |
| :----------------------------------------------------------------------------------|
| 01020000000200000000000000000000000000000000000000000000000000f03f0000000000000000 |

For the purposes of this workshop we will continue to use WKT to ensure you can read and understand the geometries we’re viewing. However, most actual processes, such as viewing data in a GIS application, transferring data to a web service, or processing data remotely, WKB is the format of choice.

Since WKT and WKB were defined in the SFSQL specification, they do not handle 3- or 4-dimensional geometries. For these cases PostGIS has defined the Extended Well Known Text (EWKT) and Extended Well Known Binary (EWKB) formats. These provide the same formatting capabilities of WKT and WKB with the added dimensionality.

Here is an example of a 3D linestring in WKT:

```sql
SELECT ST_AsText(ST_GeometryFromText('LINESTRING(0 0 0,1 0 0,1 1 2)'));
```

| st_astext                        |
| :------------------------------- |
| LINESTRING Z (0 0 0,1 0 0,1 1 2) |

**Note** that the text representation changes! This is because the text input routine for PostGIS is liberal in what it consumes. It will consume
- hex-encoded EWKB,
- extended well-known text, and
- ISO standard well-known text.

On the output side, the ST_AsText function is conservative, and only emits ISO standard well-known text.

In addition to the ST_GeometryFromText function, there are many other ways to create geometries from well-known text or similar formatted inputs:

```sql
-- Using ST_GeomFromText with the SRID parameter
SELECT ST_GeomFromText('POINT(2 2)',4326);

-- Using ST_GeomFromText without the SRID parameter
SELECT ST_SetSRID(ST_GeomFromText('POINT(2 2)'),4326);

-- Using a ST_Make* function
SELECT ST_SetSRID(ST_MakePoint(2, 2), 4326);

-- Using PostgreSQL casting syntax and ISO WKT
SELECT ST_SetSRID('POINT(2 2)'::geometry, 4326);

-- Using PostgreSQL casting syntax and extended WKT
SELECT 'SRID=4326;POINT(2 2)'::geometry;
```

In addition to emitters for the various forms (WKT, WKB, GML, KML, JSON, SVG), PostGIS also has consumers for four (WKT, WKB, GML, KML). Most applications use the WKT or WKB geometry creation functions, but the others work too. Here’s an example that consumes GML and output JSON:

```sql
SELECT ST_AsGeoJSON(ST_GeomFromGML('<gml:Point><gml:coordinates>1,1</gml:coordinates></gml:Point>'));
```

| st_asgeojson                         |
| :----------------------------------- |
| {"type":"Point","coordinates":[1,1]} |

## Casting from Text
The WKT strings we’ve see so far have been of type ‘text’ and we have been converting them to type ‘geometry’ using PostGIS functions like **ST_GeomFromText()**.

PostgreSQL include a short form syntax that allows data to be converted from one type to another, the casting syntax, _oldata::newtype_. So for example, this SQL converts a double into a text string.

```sql
SELECT 0.9::text;
```

| text |
| :--- |
| 0.9  |

Less trivially, this SQL converts a WKT string into a geometry:

```sql
SELECT 'POINT(0 0)'::geometry;
```

| geometry    |
| :---------- |
| POINT (0 0) |

One thing to note about using casting to create geometries: unless you specify the SRID, you will get a geometry with an unknown SRID. You can specify the SRID using the “extended” well-known text form, which includes an SRID block at the front:

```sql
SELECT 'SRID=4326;POINT(0 0)'::geometry;
```

| geometry    |
| :---------- |
| POINT (0 0) |

It’s very common to use the casting notation when working with WKT, as well as geometry and geography columns.

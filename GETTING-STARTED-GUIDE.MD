# Getting Started Guide
- [Purpose](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#purpose)
- [Bill of Materials](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#bill-of-materials)
- [Disclaimer](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#disclaimer)
- [Instructions](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#instructions--background-info)
- [Exercises](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#modulesexercises-included-in-this-demo)

## Purpose
The purpose of this Getting Started Guide is to showcase the use of PostGIS on top of [Pivotal](http://pivotal.io) [Greenplum Database](http://greenplum.org). This guide has been build mostly upon the [work](https://github.com/boundlessgeo/workshops) our friends at [Boundless](http://boundlessgeo.com/) have done in the past, and has been extended to utilize and present data available and for the area of Greater London, UK.

## Bill of Materials
### Software
- Greenplum Database Sandbox OVA for VMWare (available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
- PostGIS 2.1.5+pivotal.1 for RHEL 6 extension package (also available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
### Data
Two separate datasets are used throughout this demo, the original [Boundless demo](https://github.com/boundlessgeo/workshops) dataset for New York City (shapefiles) and the new dataset from Ordnance Survey Open Data and TfL free Transport Data Service for London.

Detailed information for each dataset is available [here](ABOUTDATA.md).

## Disclaimer
- Use of Ordnance Survey data is subject to terms at www.ordnancesurvey.co.uk/opendata/licence. Contains Ordnance Survey data © Crown copyright and database right 2018. Contains Royal Mail data © Royal Mail copyright and database right 2018. Contains National Statistics data © Crown copyright and database right 2018.
- [TfL free Transport Data Service](https://tfl.gov.uk/info-for/open-data-users/) is 'Powered by TfL Open Data' and 'contains OS data © Crown copyright and database rights 2016'.
- All the software in the package is open source, and freely redistributable. 
- This workshop is licensed as Creative Commons [“share alike with attribution”](http://creativecommons.org/licenses/by-sa/3.0/us/), and is freely redistributable under the terms of that license.

## Instructions & Background Info
- [Greenplum Database](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database)
- [PostGIS Extension](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension)
- [Geometries](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometries)
- [How to Load GIS (Vector) Data](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#how-to-load-gis-vector-data)
- [About the Demo Dataset](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-the-demo-dataset)
- [Loading the Demo Dataset into Greenplum](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#loading-the-demo-dataset-into-greenplum)

### Greenplum Database
Read [Welcome to Pivotal Greenplum Database](GPDB.md) page for information on Greenplum Database.
### PostGIS Extension
- [About PostGIS](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-postgis)
- [PostGIS Extension package for Greenplum](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension-package-for-greenplum)
- [Enabling PostGIS Support](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#enabling-postgis-support)
- [Greenplum Database PostGIS Extension Support & Limitations](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database-postgis-extension-support--limitations)

#### About PostGIS
PostGIS is a spatial database extension for PostgreSQL that allows GIS (Geographic Information Systems) objects to be stored in the database. The Greenplum Database PostGIS extension includes support for GiST-based R-Tree spatial indexes and functions for analysis and processing of GIS objects.

The Greenplum Database PostGIS extension supports the optional PostGIS raster data type and most PostGIS Raster functions. With the PostGIS Raster objects, PostGIS geometry data type offers a single set of overlay SQL functions (such as ST_Intersects) operating seamlessly on vector and raster geospatial data. PostGIS Raster uses the GDAL (Geospatial Data Abstraction Library) translator library for raster geospatial data formats that presents a [single raster abstract data model to a calling application](http://www.gdal.org/gdal_datamodel.html).

For information about PostGIS, see http://postgis.refractions.net/

For information about GDAL, see http://www.gdal.org.

#### PostGIS Extension package for Greenplum
The Greenplum Database PostGIS extension package is available from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb). You can install the package using the Greenplum Package Manager (gppkg). For details, see [***gppkg***](https://gpdb.docs.pivotal.io/latest/utility_guide/admin_utilities/gppkg.html) in the Greenplum Database Utility Guide.

Greenplum Database supports the PostGIS extension with these component versions.
- PostGIS 2.1.5
- Proj 4.8.0
- Geos 3.4.2
- GDAL 1.11.1
- Json 0.12
- Expat 2.1.0

#### Enabling PostGIS Support
The Greenplum Database PostGIS extension contains the postgis_manager.sh script that installs or removes both the PostGIS and PostGIS Raster features in a database. After the PostGIS extension package is installed, the script is in $GPHOME/share/postgresql/contrib/postgis-2.1/. The postgis_manager.sh script runs SQL scripts that install or remove PostGIS and PostGIS Raster from a database.

Run the postgis_manager.sh script specifying the database and with the install option to install PostGIS and PostGIS Raster. This example installs PostGIS and PostGIS Raster objects in the database mydatabase.
postgis_manager.sh mydatabase install
The script runs all the PostGIS SQL scripts that enable PostGIS in a database: install/postgis.sql, install/rtpostgis.sql install/spatial_ref_sys.sql, install/postgis_comments.sql, and install/raster_comments.sql.

The postGIS package installation adds these lines to the greenplum_path.sh file for PostGIS Raster support.

```sql
export GDAL_DATA=$GPHOME/share/gdal
export POSTGIS_ENABLE_OUTDB_RASTERS=0
export POSTGIS_GDAL_ENABLED_DRIVERS=DISABLE_ALL
```

PostGIS uses GDAL raster drivers when processing raster data with commands such as `ST_AsJPEG()`. As the default, PostGIS disables all raster drivers. You enable raster drivers by setting the value of the POSTGIS_GDAL_ENABLED_DRIVERS environment variable in the greenplum_path.sh file on all Greenplum Database hosts.

To see the list of supported GDAL raster drivers for a Greenplum Database system, run the ***raster2pgsql*** utility with the -G option on the Greenplum Database master.

```shell
raster2pgsql -G 
```
The command lists the driver long format name. The GDAL Raster Formats table at http://www.gdal.org/formats_list.html lists the long format names and the corresponding codes that you specify as the value of the environment variable. For example, the code for the long name Portable Network Graphics is PNG. This example export line enables four GDAL raster drivers.

```sql
export POSTGIS_GDAL_ENABLED_DRIVERS="GTiff PNG JPEG GIF"
```
The `gpstop -r` command restarts the Greenplum Database system to use the updated settings in the greenplum_path.sh file.

After you have updated the greenplum_path.sh file on all hosts, and have restarted the Greenplum Database system, you can display the enabled raster drivers with the ST_GDALDrivers() function. This SELECT command lists the enabled raster drivers.

```sql
SELECT short_name, long_name FROM ST_GDALDrivers();
```

#### Greenplum Database PostGIS Extension Support & Limitations
- [Supported PostGIS Data Types](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#supported-postgis-data-types)
- [Supported PostGIS Index](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#supported-postgis-index)
- [Supported PostGIS Raster Data Types](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MDsupported-postgis-raster-data-types)
- [PostGIS Extension Limitations](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension-limitations)

The Greenplum Database PostGIS extension does not support the following features:
- Topology
- Some Raster Functions

##### Supported PostGIS Data Types
Greenplum Database PostGIS extension supports these PostGIS data types:
- box2d
- box3d
- geometry
- geography

##### Supported PostGIS Raster Data Types
Greenplum Database PostGIS supports these PostGIS Raster data types:
- geomval
- addbandarg
- rastbandarg
- raster
- reclassarg
- summarystats
- unionarg

##### Supported PostGIS Index
Greenplum Database PostGIS extension supports the GiST (Generalized Search Tree) index.

##### PostGIS Extension Limitations
This section lists the Greenplum Database PostGIS extension limitations for user-defined functions (UDFs), data types, and aggregates.
- Data types and functions related to PostGIS topology functionality, such as TopoGeometry, are not supported by Greenplum Database.
- Functions that perform ANALYZE operations for user-defined data types are not supported. For example, the ST_Estimated_Extent function is not supported. The function requires table column statistics for user defined data types that are not available with Greenplum Database.
- These PostGIS aggregates are not supported by Greenplum Database:
  - ST_MemCollect
  - ST_MakeLine <br/>On a Greenplum Database with multiple segments, the aggregate might return different answers if it is called several times repeatedly.
- Greenplum Database does not support PostGIS long transactions. <br/> PostGIS relies on triggers and the PostGIS table public.authorization_table for long transaction support. When PostGIS attempts to acquire locks for long transactions, Greenplum Database reports errors citing that the function cannot access the relation, authorization_table.
- Greenplum Database does not support type modifiers for user defined types. <br/> The work around is to use the AddGeometryColumn function for PostGIS geometry. For example, a table with PostGIS geometry cannot be created with the following SQL command:
```sql
CREATE TABLE geometries(id INTEGER, geom geometry(LINESTRING));
```
  Use the AddGeometryColumn function to add PostGIS geometry to a table. For example, these following SQL statements create a table and add PostGIS geometry to the table:
```sql
CREATE TABLE geometries(id INTEGER);
SELECT AddGeometryColumn('public', 'geometries', 'geom', 0, 'LINESTRING', 2);
```

### Geometries
Read the next section for better understanding and background information on how a real world objects are represented using PostGIS & SQL.
- [Introduction](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#introduction)
- [Metadata Tables](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#metadata-tables)
- [Representing Real World Objects with PostGIS](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#representing-real-world-objects-with-postgis)
- [Geometry Input and Output](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometry-input-and-output)
- [Casting from Text](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#casting-from-text)

#### Introduction
Let's start by looking at some simple examples. Within the SQL editing environment of your preference, i.e [pgAdmin](https://www.pgadmin.org/), once again select a database/schema in which PostGIS extension has been enableq and open the SQL query editing tool/panel. Paste the following example SQL code into the SQL Editor window (removing any text that may be there by default) and execute:

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

#### Metadata Tables
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

#### Representing Real World Objects with PostGIS
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

#### Supported PostGIS Geometry Types
- [Point](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#point)
- [Linestring](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#linestring)
- [Polygon](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#polygon), PolygonWithHole
- [Collection](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#collection)
  - MultiPoint
  - MultiLineString
  - MultiPolygon
  - GeometryCollection

##### Point
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

##### Linestring
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

##### Polygon
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

##### Collections
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

#### Geometry Input and Output
Within the database, geometries are stored on disk in a format only used by the PostGIS program. In order for external programs to insert and retrieve useful geometries, they need to be converted into a format that other applications can understand. Fortunately, PostGIS supports emitting and consuming geometries in a large number of formats:
- [Well-known text (WKT)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#well-known-text-wkt)
- [Well-known binary (WKB)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#well-known-binary-wkb)
- [Geographic Mark-up Language (GML)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geographic-mark-up-language-gml)
- [Keyhole Mark-up Language (KML)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#keyhole-mark-up-language-kml)
- [GeoJSON](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geojson)
- [Scalable Vector Graphics (SVG)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#scalable-vector-graphics-svg)

##### Well-known text (WKT)
- **ST_GeomFromText(text, srid)** returns geometry
- **ST_AsText(geometry)** returns text
- **ST_AsEWKT(geometry)** returns text
##### Well-known binary (WKB)
- **ST_GeomFromWKB(bytea)** returns geometry
- **ST_AsBinary(geometry)** returns bytea
- **ST_AsEWKB(geometry)** returns bytea
##### Geographic Mark-up Language (GML)
- **ST_GeomFromGML(text)** returns geometry
- **ST_AsGML(geometry)** returns text
##### Keyhole Mark-up Language (KML)
- **ST_GeomFromKML(text)** returns geometry
- **ST_AsKML(geometry)** returns text
##### GeoJSON
- **ST_AsGeoJSON(geometry)** returns text
##### Scalable Vector Graphics (SVG)
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

#### Casting from Text
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

### How to Load GIS (Vector) Data
Find generic information on how to load GIS data into a Pivotal Greenplum database [here](HOWTO-LOAD-GIS-DATA.md) page.
### About the Demo Dataset
Read [About the demo dataset](ABOUTDATA.md) page for information on number of records and table attributes for the datasets used in this demo.
### Loading the Demo Dataset into Greenplum
Follow the detailed instructions available [here](LOAD-GIS-DATASETS-INTO-GPDB.md), on how to load the demo GIS datasets into a Pivotal Greenplum database.

## Modules/Exercises included in this demo
- [**Simple SQL exercises**](SIMPLE-SQL.md)
- [**Geo/PostGIS SQL**](GEO-POSTGIS-SQL.md)


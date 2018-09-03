# Getting Started Guide

- [Purpose](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#purpose)
- [Bill of Materials](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#bill-of-materials) 
  - [Software](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#software)
  - [Datasets](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#data)
- [Disclaimer](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#disclaimer)
- [Instructions](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#instructions--background-info)
  - [Greenplum Database](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database)
  - [PostGIS Extension](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension)
    - [About PostGIS](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-postgis)
    - [PostGIS Extension package for Greenplum](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension-package-for-greenplum)
    - [Enabling PostGIS Support](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#enabling-postgis-support)
    - [Greenplum Database PostGIS Extension Support & Limitations](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database-postgis-extension-support--limitations)
  - [Geometries](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometries)
    - [Introduction](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#introduction)
    - [Metadata Tables](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#metadata-tables)
    - [Representing Real World Objects with PostGIS](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#representing-real-world-objects-with-postgis)
    - [Supported PostGIS Geometry Types](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#supported-postgis-geometry-types)
    - [Geometry Input and Output](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometry-input-and-output)
    - [Casting from Text](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#casting-from-text)
  - [How to Load GIS (Vector) Data](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#how-to-load-gis-vector-data)
    - [Loading Data Using SQL](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#loading-data-using-sql)
    - [shp2pgsql (ESRI Shapefile Loader)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#shp2pgsql-using-the-esri-shapefile-loader)
  - [About the Demo Datasets](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-the-demo-datasets)
  - [Loading the Demo Datasets into Greenplum](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#loading-the-demo-datasets-into-greenplum)
- [Practical Examples & Exercises](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#practical-examples--exercises)
  - [Pivotal Greenplum & PostGIS Basics](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#pivotal-greenplum--postgis-basics)
  - [Spatial Geometries & Relationships](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#spatial-geometries--relationships)
  - [Spatial Joins](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#spatial-joins)

# Purpose
The purpose of this Getting Started Guide is to showcase the use of PostGIS on top of [Pivotal](http://pivotal.io) [Greenplum Database](http://greenplum.org). This guide has been build mostly upon the [work](https://github.com/boundlessgeo/workshops) our friends at [Boundless](http://boundlessgeo.com/) have done in the past, and has been extended to utilize and present data available and for the area of Greater London, UK.

# Bill of Materials
- [Software](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#software)
- [Datasets](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#data)

## Software
- Greenplum Database Sandbox OVA for VMWare (available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
- PostGIS 2.1.5+pivotal.1 for RHEL 6 extension package (also available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))

## Data
Two separate datasets are used throughout this demo, the original [Boundless demo](https://github.com/boundlessgeo/workshops) dataset for New York City (shapefiles) and the new dataset from Ordnance Survey Open Data and TfL free Transport Data Service for London.

Detailed information for each dataset is available [here](ABOUTDATA.md).

# Disclaimer
- Use of Ordnance Survey data is subject to terms at www.ordnancesurvey.co.uk/opendata/licence. Contains Ordnance Survey data © Crown copyright and database right 2018. Contains Royal Mail data © Royal Mail copyright and database right 2018. Contains National Statistics data © Crown copyright and database right 2018.
- [TfL free Transport Data Service](https://tfl.gov.uk/info-for/open-data-users/) is 'Powered by TfL Open Data' and 'contains OS data © Crown copyright and database rights 2016'.
- All the software in the package is open source, and freely redistributable. 
- This workshop is licensed as Creative Commons [“share alike with attribution”](http://creativecommons.org/licenses/by-sa/3.0/us/), and is freely redistributable under the terms of that license.

# Instructions & Background Info
- [Greenplum Database](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database)
- [PostGIS Extension](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension)
- [Geometries](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometries)
- [How to Load GIS (Vector) Data](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#how-to-load-gis-vector-data)
- [About the Demo Datasets](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-the-demo-datasets)
- [Loading the Demo Datasets into Greenplum](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#loading-the-demo-datasets-into-greenplum)

## Greenplum Database
Read [Welcome to Pivotal Greenplum Database](GPDB.md) page for information on Greenplum Database.
## PostGIS Extension
- [About PostGIS](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-postgis)
- [PostGIS Extension package for Greenplum](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension-package-for-greenplum)
- [Enabling PostGIS Support](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#enabling-postgis-support)
- [Greenplum Database PostGIS Extension Support & Limitations](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database-postgis-extension-support--limitations)

### About PostGIS
PostGIS is a spatial database extension for PostgreSQL that allows GIS (Geographic Information Systems) objects to be stored in the database. The Greenplum Database PostGIS extension includes support for GiST-based R-Tree spatial indexes and functions for analysis and processing of GIS objects.

The Greenplum Database PostGIS extension supports the optional PostGIS raster data type and most PostGIS Raster functions. With the PostGIS Raster objects, PostGIS geometry data type offers a single set of overlay SQL functions (such as `ST_Intersects()`) operating seamlessly on vector and raster geospatial data. PostGIS Raster uses the GDAL (Geospatial Data Abstraction Library) translator library for raster geospatial data formats that presents a [single raster abstract data model to a calling application](http://www.gdal.org/gdal_datamodel.html).

For information about PostGIS, see [http://postgis.refractions.net/](http://postgis.refractions.net/).

For information about GDAL, see [http://www.gdal.org](http://www.gdal.org).

### PostGIS Extension package for Greenplum
The Greenplum Database PostGIS extension package is available from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb). You can install the package using the Greenplum Package Manager (***gppkg***). For details, see [***gppkg***](https://gpdb.docs.pivotal.io/latest/utility_guide/admin_utilities/gppkg.html) in the Greenplum Database Utility Guide.

Greenplum Database supports the PostGIS extension with these component versions.

- PostGIS 2.1.5
- Proj 4.8.0
- Geos 3.4.2
- GDAL 1.11.1
- Json 0.12
- Expat 2.1.0

### Enabling PostGIS Support
The Greenplum Database PostGIS extension contains the `postgis_manager.sh` script that installs or removes both the PostGIS and PostGIS Raster features in a database. After the PostGIS extension package is installed, the script is in `$GPHOME/share/postgresql/contrib/postgis-2.1/`. The `postgis_manager.sh` script runs SQL scripts that install or remove PostGIS and PostGIS Raster from a database.

Run the `postgis_manager.sh` script specifying the database and with the install option to install PostGIS and PostGIS Raster. This example installs PostGIS and PostGIS Raster objects in the database mydatabase.
postgis_manager.sh mydatabase install
The script runs all the PostGIS SQL scripts that enable PostGIS in a database: `install/postgis.sql`, `install/rtpostgis.sql` `install/spatial_ref_sys.sql`, `install/postgis_comments.sql`, and `install/raster_comments.sql`.

The postGIS package installation adds these lines to the `greenplum_path.sh` file for PostGIS Raster support.

``` sql
export GDAL_DATA=$GPHOME/share/gdal
export POSTGIS_ENABLE_OUTDB_RASTERS=0
export POSTGIS_GDAL_ENABLED_DRIVERS=DISABLE_ALL
```

PostGIS uses GDAL raster drivers when processing raster data with commands such as `ST_AsJPEG()`. As the default, PostGIS disables all raster drivers. You can enable raster drivers by setting the value of the **POSTGIS\_GDAL\_ENABLED\_DRIVERS** environment variable in the `greenplum_path.sh` file on all Greenplum Database hosts.

To see the list of supported GDAL raster drivers for a Greenplum Database system, run the ***raster2pgsql*** utility with the **-G** option on the Greenplum Database master.

``` shell
raster2pgsql -G 
```
The command lists the driver long format name. The GDAL Raster Formats table at [http://www.gdal.org/formats_list.html](http://www.gdal.org/formats_list.html) lists the long format names and the corresponding codes that you specify as the value of the environment variable. For example, the code for the long name Portable Network Graphics is PNG. This example export line enables four GDAL raster drivers.

``` sql
export POSTGIS_GDAL_ENABLED_DRIVERS="GTiff PNG JPEG GIF"
```

The `gpstop -r` command restarts the Greenplum Database system to use the updated settings in the `greenplum_path.sh` file.

After you have updated the `greenplum_path.sh` file on all hosts, and have restarted the Greenplum Database system, you can display the enabled raster drivers with the `ST_GDALDrivers()` function. This `SELECT` command lists the enabled raster drivers.

``` sql
SELECT short_name, long_name FROM ST_GDALDrivers();
```

### Greenplum Database PostGIS Extension Support & Limitations
- [Supported PostGIS Data Types](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#supported-postgis-data-types)
- [Supported PostGIS Raster Data Types](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MDsupported-postgis-raster-data-types)
- [Supported PostGIS Index](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#supported-postgis-index)
- [Greenplum Database PostGIS Extension Limitations](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#greenplum-database-postgis-extension-limitations)

#### Supported PostGIS Data Types
Greenplum Database PostGIS extension supports these PostGIS data types:

- box2d
- box3d
- geometry
- geography

#### Supported PostGIS Raster Data Types
Greenplum Database PostGIS supports these PostGIS Raster data types:

- geomval
- addbandarg
- rastbandarg
- raster
- reclassarg
- summarystats
- unionarg

#### Supported PostGIS Index
Greenplum Database PostGIS extension supports the GiST (Generalized Search Tree) index.

#### Greenplum Database PostGIS Extension Limitations
Greenplum Database PostGIS extension does not support the following features:  

- Topology
- Some Raster Functions

Additionally, Greenplum Database PostGIS extension has certain limitations for user-defined functions (UDFs), data types, and aggregates:  

- Data types and functions related to PostGIS topology functionality, such as `TopoGeometry()`, are not supported by Greenplum Database.
- Functions that perform `ANALYZE` operations for user-defined data types are not supported. For example, the `ST_Estimated_Extent()` function is not supported. The function requires table column statistics for user defined data types that are not available with Greenplum Database.
- The `ST_MemCollect` and `ST_MakeLine` PostGIS aggregates are not supported by Greenplum Database. On a Greenplum Database with multiple segments, the aggregate might return different answers if it is called several times repeatedly.  
- Greenplum Database does not support PostGIS long transactions. PostGIS relies on triggers and the PostGIS table public.authorization\_table for long transaction support. When PostGIS attempts to acquire locks for long transactions, Greenplum Database reports errors citing that the function cannot access the relation, authorization\_table.
- Greenplum Database does not support type modifiers for user defined types. The work around is to use the `AddGeometryColumn` function for PostGIS geometry. For example, a table with PostGIS geometry cannot be created with the following SQL command:
  
  ``` sql
  CREATE TABLE geometries(id INTEGER, geom geometry(LINESTRING));
  ```
  
  Use the `AddGeometryColumn()` function to add PostGIS geometry to a table. For example, these following SQL statements create a table and add PostGIS geometry to the table:
  
  ``` sql
  CREATE TABLE geometries(id INTEGER);
  SELECT AddGeometryColumn('public', 'geometries', 'geom', 0, 'LINESTRING', 2);
  ```

## Geometries
Read the next section for better understanding and background information on how a real world objects are represented using PostGIS & SQL.

- [Introduction](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#introduction)
- [Metadata Tables](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#metadata-tables)
- [Representing Real World Objects with PostGIS](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#representing-real-world-objects-with-postgis)
- [Supported PostGIS Geometry Types](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#supported-postgis-geometry-types)
- [Geometry Input and Output](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometry-input-and-output)
- [Casting from Text](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#casting-from-text)

### Introduction
Let's start by looking at some simple examples. Within the SQL editing environment of your preference, i.e [pgAdmin](https://www.pgadmin.org/), once again select a database/schema in which PostGIS extension has been enableq and open the SQL query editing tool/panel. Paste the following example SQL code into the SQL Editor window (removing any text that may be there by default) and execute:

``` sql
CREATE TABLE geometries (name varchar, geom geometry);

INSERT INTO geometries VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');
```

The above example creates the ***geometries*** table and inserts five new geometries into it: a point, a line, a polygon, a polygon with a hole, and a collection. Here is how a `SELECT` over the _geometries_ tables, looks like: 

``` sql
SELECT name, ST_AsText(geom)
  FROM geometries;
```

| name            | st_astext                                                     |
| :---            | :------------------------------------------------------------ |
| Point           | POINT(0 0)                                                    |
| Polygon         | POLYGON((0 0,1 0,1 1,0 1,0 0))                                |
| PolygonWithHole | POLYGON((0 0,10 0,10 10,0 10,0 0),(1 1,1 2,2 2,2 1,1 1))      |
| Collection      | GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0,1 0,1 1,0 1,0 0))) |
| Linestring      | LINESTRING(0 0,1 1,2 1,2 2)                                   |

### Metadata Tables
In conformance with the Simple Features for SQL (SFSQL) specification, PostGIS provides two tables to track and report on the geometry types available in a given database.

- The first table, ***spatial\_ref\_sys***, defines all the spatial reference systems known to the database and will be described in greater detail later.
- The second table (actually, a view), ***geometry\_columns***, provides a listing of all “features” (defined as an object with geometric attributes), and the basic details of those features.

Let’s have a look at the geometry_columns table in our database. Paste this command in the Query Tool as before:

``` sql
SELECT *
  FROM geometry_columns;
```

By querying this table, GIS clients and libraries can determine what to expect when retrieving data and can perform any necessary projection, processing or rendering without needing to inspect each geometry.

| f\_table\_catalog | f\_table\_schema | f\_table\_name      | f\_geometry\_column | coord\_dimension | srid  | type         |
| :-------------- | :------------- | :---------------- | :---------------- | :-------------- | :---- | :----------- |
| nyc             | public         | nyc\_census\_blocks | geom              | 2               | 26918 | MULTIPOLYGON |
| nyc             | public         | geometries        | geom              | 2               | 0     | GEOMETRY     |


(_example for illustrative purposes, own result may differ from the one shown here_)

- **f\_table\_catalog**, **f\_table_schema**, and **f\_table_name** provide the fully qualified name of the feature table containing a given geometry. Because PostgreSQL doesn’t make use of catalogs, **f\_table_catalog** will tend to be empty.
- **f\_geometry\_column** is the name of the column that geometry containing column – for feature tables with multiple geometry columns, there will be one record for each.
- **coord\_dimension** and **srid** define the the dimension of the geometry (2-, 3- or 4-dimensional) and the Spatial Reference system identifier that refers to the **spatial\_ref\_sys** table respectively.
- The **type** column defines the type of geometry as described below; we’ve seen Point and Linestring types so far.

### Representing Real World Objects with PostGIS
The Simple Features for SQL (SFSQL) specification, the original guiding standard for PostGIS development, defines how a real world object is represented. By taking a continuous shape and digitizing it at a fixed resolution we achieve a passable representation of the object. SFSQL only handled 2-dimensional representations. PostGIS has extended that to include 3- and 4-dimensional representations; more recently the SQL-Multimedia Part 3 (SQL/MM) specification has officially defined their own representation.

Our example table contains a mixture of different geometry types. We can collect general information about each object using functions that read the geometry metadata.

- **`ST_GeometryType(geometry)`** returns the type of the geometry
- **`ST_NDims(geometry)`** returns the number of dimensions of the geometry
- **`ST_SRID(geometry)`** returns the spatial reference identifier number of the geometry

``` sql
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

## Supported PostGIS Geometry Types
- [Point](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#point)
- [Linestring](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#linestring)
- [Polygon & PolygonWithHole](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#polygon) 
- [Collection, MultiPoint, MultiLineString, MultiPolygon, GeometryCollection](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#collection-multipoint-multilinestring-multipolygon-geometrycollection)

### Point
![Image of PostGIS Points - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/points.png)

A spatial point represents a single location on the Earth. This point is represented by a single coordinate (including either 2-, 3- or 4-dimensions). Points are used to represent objects when the exact details, such as shape and size, are not important at the target scale. For example, cities on a map of the world can be described as points, while a map of a single state might represent cities as polygons.

``` sql
SELECT ST_AsText(geom)
  FROM geometries
  WHERE name = 'Point';
```

| st_astext  |
| :----------|
| POINT(0 0) |

Some of the specific spatial functions for working with points are:

- **`ST_X(geometry)`**, returns the X ordinate.
- **`ST_Y(geometry)`**, returns the Y ordinate.

So, we can read the ordinates from a point like this:

``` sql
SELECT ST_X(geom), ST_Y(geom)
  FROM geometries
  WHERE name = 'Point';
```

In the dataset provided for this demo, The New York City subway stations (***nyc\_subway\_stations***) table is a data set represented as points. The following SQL query will return the geometry associated with one point (in the `st_astext ` column).

``` sql
SELECT name, ST_AsText(geom)
  FROM nyc_subway_stations
  LIMIT 1;
```

### Linestring
![Image of PostGIS Linestrings - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/lines.png)

A linestring is a path between locations. It takes the form of an ordered series of two or more points. Roads and rivers are typically represented as linestrings. A linestring is said to be closed if it starts and ends on the same point. It is said to be simple if it does not cross or touch itself (except at its endpoints if it is closed). A linestring can be both closed and simple.

The street network for New York (***nyc\_streets***) dataset contains details such as name, and type. A single real world street may consist of many linestrings, each representing a segment of road with different attributes.

The following SQL query will return the geometry associated with one linestring (in the `st_astext ` column).

``` sql
SELECT ST_AsText(geom)
  FROM geometries
  WHERE name = 'Linestring';
```

| st_astext                      |
| :------------------------------|
| LINESTRING(0 0, 1 1, 2 1, 2 2) |

Some of the specific spatial functions for working with linestrings are:
- **`ST_Length(geometry)`**, returns the length of the linestring.
- **`ST_StartPoint(geometry)`**, returns the first coordinate as a point.
- **`ST_EndPoint(geometry)`**, returns the last coordinate as a point.
- **`ST_NPoints(geometry)`**, returns the number of coordinates in the linestring.

So, the length of our linestring is:

``` sql
SELECT ST_Length(geom)
  FROM geometries
  WHERE name = 'Linestring';
```

| st_length        |
| :----------------|
| 3.41421356237309 |

### Polygon & PolygonWithHole
![Image of PostGIS Polygons - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/polygons.png)

A polygon is a representation of an area. The outer boundary of the polygon is represented by a ring. This ring is a linestring that is both closed and simple as defined above. Holes within the polygon are also represented by rings.

Polygons are used to represent objects whose size and shape are important. City limits, parks, building footprints or bodies of water are all commonly represented as polygons when the scale is sufficiently high to see their area. Roads and rivers can sometimes be represented as polygons.

The following SQL query will return the geometry associated with one linestring (in the `ST_AsText` column).

``` sql
SELECT ST_AsText(geom)
  FROM geometries
  WHERE name LIKE 'Polygon%';
```

| ***Note*** |
| :--------- |
| Rather than using an ``=`` sign in our ``WHERE`` clause, we are using the ``LIKE`` operator to carry out a string matching operation. You may be used to the ``*`` symbol as a “glob” for pattern matching, but in SQL the ``%`` symbol is used, along with the ``LIKE`` operator to tell the system to do globbing. |

| st_astext                                                        |
| :----------------------------------------------------------------|
| POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))                               |
| POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1)) |

The first polygon has only one ring. The second one has an interior “hole”. Most graphics systems include the concept of a “polygon”, but GIS systems are relatively unique in allowing polygons to explicitly have holes.

![Image of PostGIS Polygons - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/polygons1.png)

Some of the specific spatial functions for working with polygons are:

- **`ST_Area(geometry)`**, returns the area of the polygons.
- **`ST_NRings(geometry)`**, returns the number of rings (usually 1, more of there are holes).
- **`ST_ExteriorRing(geometry)`**, returns the outer ring as a linestring.
- **`ST_InteriorRingN(geometry,n)`**, returns a specified interior ring as a linestring.
- **`ST_Perimeter(geometry)`**, returns the length of all the rings.

We can calculate the area of our polygons using the area function:

``` sql
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

### Collection, MultiPoint, MultiLineString, MultiPolygon, GeometryCollection
There are four collection types, which group multiple simple geometries into sets.

- **`MultiPoint`**, a collection of points.
- **`MultiLineString`**, a collection of linestrings.
- **`MultiPolygon`**, a collection of polygons.
- **`GeometryCollection`**, a heterogeneous collection of any geometry (including other collections).

Collections are another concept that shows up in GIS software more than in generic graphics software. They are useful for directly modeling real world objects as spatial objects. For example, how to model a lot that is split by a right-of-way? As a MultiPolygon, with a part on either side of the right-of-way.

![Image of PostGIS Collections - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/collection2.png)

Our example collection contains a polygon and a point:

``` sql
SELECT name, ST_AsText(geom)
  FROM geometries
  WHERE name = 'Collection';
```

| name       | st_astext                                                     |
| :----------| :-------------------------------------------------------------|
| Collection | GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0,1 0,1 1,0 1,0 0))) |

![Image of PostGIS Collections - Boundless](http://workshops.boundlessgeo.com/postgis-intro/_images/collection.png)

Some of the specific spatial functions for working with collections are:

- **`ST_NumGeometries(geometry)`**, returns the number of parts in the collection.
- **`ST_GeometryN(geometry,n)`**, returns the specified part.
- **`ST_Area(geometry)`**, returns the total area of all polygonal parts.
- **`ST_Length(geometry)`**, returns the total length of all linear parts.

## Geometry Input and Output
Within the database, geometries are stored on disk in a format only used by the PostGIS program. In order for external programs to insert and retrieve useful geometries, they need to be converted into a format that other applications can understand. Fortunately, PostGIS supports emitting and consuming geometries in a large number of formats:

- [Well-known text (WKT)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#well-known-text-wkt)
- [Well-known binary (WKB)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#well-known-binary-wkb)
- [Geographic Mark-up Language (GML)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geographic-mark-up-language-gml)
- [Keyhole Mark-up Language (KML)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#keyhole-mark-up-language-kml)
- [GeoJSON](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geojson)
- [Scalable Vector Graphics (SVG)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#scalable-vector-graphics-svg)

### Well-known text (WKT)
- **`ST_GeomFromText(text, srid)`**, returns geometry.
- **`ST_AsText(geometry)`**, returns text.
- **`ST_AsEWKT(geometry)`**, returns text.
### Well-known binary (WKB)
- **`ST_GeomFromWKB(bytea)`**, returns geometry.
- **`ST_AsBinary(geometry)`**, returns bytea.
- **`ST_AsEWKB(geometry)`**, returns bytea.
### Geographic Mark-up Language (GML)
- **`ST_GeomFromGML(text)`**, returns geometry.
- **`ST_AsGML(geometry)`**, returns text.
### Keyhole Mark-up Language (KML)
- **`ST_GeomFromKML(text)`** ,returns geometry.
- **`ST_AsKML(geometry)`**, returns text.
### GeoJSON
- **`ST_AsGeoJSON(geometry)`**, returns text.
### Scalable Vector Graphics (SVG)
- **`ST_AsSVG(geometry)`**, returns text.

The most common use of a constructor is to turn a text representation of a geometry into an internal representation.

Note that in addition to a text parameter with a geometry representation, we also have a numeric parameter providing the SRID of the geometry.

The following SQL query shows an example of WKB representation (the call to `encode()` is required to convert the binary output into an ASCII form for printing):

``` sql
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

``` sql
SELECT ST_AsText(ST_GeometryFromText('LINESTRING(0 0 0,1 0 0,1 1 2)'));
```

| st_astext                        |
| :------------------------------- |
| LINESTRING Z (0 0 0,1 0 0,1 1 2) |

**Note** that the text representation changes! This is because the text input routine for PostGIS is liberal in what it consumes. It will consume
- hex-encoded EWKB,
- extended well-known text, and
- ISO standard well-known text.

On the output side, the `ST_AsText` function is conservative, and only emits ISO standard well-known text.

In addition to the `ST_GeometryFromText` function, there are many other ways to create geometries from well-known text or similar formatted inputs:

``` sql
-- Using ST_GeomFromText with the SRID parameter
SELECT ST_GeomFromText('POINT(2 2)',4326);

-- Using ST_GeomFromText without the SRID parameter
SELECT ST_SetSRID(ST_GeomFromText('POINT(2 2)'),4326);

-- Using a ST_MakePoint function
SELECT ST_SetSRID(ST_MakePoint(2, 2), 4326);

-- Using PostgreSQL casting syntax and ISO WKT
SELECT ST_SetSRID('POINT(2 2)'::geometry, 4326);

-- Using PostgreSQL casting syntax and extended WKT
SELECT 'SRID=4326;POINT(2 2)'::geometry;
```

In addition to emitters for the various forms (WKT, WKB, GML, KML, JSON, SVG), PostGIS also has consumers for four (WKT, WKB, GML, KML). Most applications use the WKT or WKB geometry creation functions, but the others work too. Here’s an example that consumes GML and output JSON:

``` sql
SELECT ST_AsGeoJSON(ST_GeomFromGML('<gml:Point><gml:coordinates>1,1</gml:coordinates></gml:Point>'));
```

| st_asgeojson                         |
| :----------------------------------- |
| {"type":"Point","coordinates":[1,1]} |

### Casting from Text
The WKT strings we’ve see so far have been of type ‘text’ and we have been converting them to type ‘geometry’ using PostGIS functions like **`ST_GeomFromText()`**.

PostgreSQL include a short form syntax that allows data to be converted from one type to another, the casting syntax, _oldata::newtype_. So for example, this SQL converts a double into a text string.

``` sql
SELECT 0.9::text;
```

| text |
| :--- |
| 0.9  |

Less trivially, this SQL converts a WKT string into a geometry:

``` sql
SELECT 'POINT(0 0)'::geometry;
```

| geometry    |
| :---------- |
| POINT (0 0) |

One thing to note about using casting to create geometries: unless you specify the SRID, you will get a geometry with an unknown SRID. You can specify the SRID using the “extended” well-known text form, which includes an SRID block at the front:

``` sql
SELECT 'SRID=4326;POINT(0 0)'::geometry;
```

| geometry    |
| :---------- |
| POINT (0 0) |

It’s very common to use the casting notation when working with WKT, as well as geometry and geography columns.

## How to Load GIS (Vector) Data

- [Loading Data Using SQL](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#loading-data-using-sql)
- [shp2pgsql (ESRI Shapefile Loader)](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#shp2pgsql-using-the-esri-shapefile-loader)

### Loading Data Using SQL
If converting your input data to a text representation is an option then using formatted SQL might be the easiest way to get the dataset into PostGIS. As with Oracle and other SQL databases, data can be bulk loaded by piping a large text file full of SQL `INSERT` statements into the SQL terminal monitor. 

A data upload file might look something like this:

``` sql
INSERT INTO roads (road_id, roads_geom, road_name)
	VALUES (1,ST_GeomFromText('LINESTRING(191232 243118,191108 243242)',-1),'Jeff Rd');
INSERT INTO roads (road_id, roads_geom, road_name)
	VALUES (2,ST_GeomFromText('LINESTRING(189141 244158,189265 244817)',-1),'Geordie Rd');
INSERT INTO roads (road_id, roads_geom, road_name)
	VALUES (3,ST_GeomFromText('LINESTRING(192783 228138,192612 229814)',-1),'Paul St');
INSERT INTO roads (road_id, roads_geom, road_name)
	VALUES (4,ST_GeomFromText('LINESTRING(189412 252431,189631 259122)',-1),'Graeme Ave');
INSERT INTO roads (road_id, roads_geom, road_name)
	VALUES (5,ST_GeomFromText('LINESTRING(190131 224148,190871 228134)',-1),'Phil Tce');
INSERT INTO roads (road_id, roads_geom, road_name)
	VALUES (6,ST_GeomFromText('LINESTRING(198231 263418,198213 268322)',-1),'Dave Cres');
```

The data file can be piped into Postgres or Greenplum very easily using the `psql` SQL utility:

``` sql
psql -d [database] -f [file]
```

### shp2pgsql: Using the ESRI Shapefile Loader
The `shp2pgsql` data loader converts ESRI Shape files into SQL suitable for insertion into a PostGIS/PostgreSQL database either in geometry or geography format. The loader has several operating modes distinguished by command line flags:

In addition to the `shp2pgsql` command-line loader, there is an `shp2pgsql-gui` graphical interface with most of the options as the command-line loader, but may be easier to use for one-off non-scripted loading or if you are new to PostGIS. It can also be configured as a plugin to PgAdminIII.

| Option | Description                                                                        |
| :---   | :----------------------------------------------------------------------------------|
| -c     | Creates a new table and populates it from the shapefile. This is the default mode. |
| -a     | Appends data from the Shape file into the database table. Note that to use this option to load multiple files, the files must have the same attributes and same data types. |
| -d     | Drops the database table before creating a new table with the data in the Shape file. |
| -p     | Only produces the table creation SQL code, without adding any actual data. This can be used if you need to completely separate the table creation and data loading steps. <br> **Note:** options c, a, d, p above, are **mutually exclusive**. |
| -?     | Display help screen. |
| -D     | Use the PostgreSQL "dump" format for the output data. This can be combined with -a, -c and -d. It is much faster to load than the default "insert" SQL format. Use this for very large data sets. |
| -s [\<FROM\_SRID\>:]\<SRID\> | Creates and populates the geometry tables with the specified SRID. Optionally specifies that the input shapefile uses the given FROM\_SRID, in which case the geometries will be reprojected to the target SRID. FROM\_SRID cannot be specified with -D. |
| -k     | Keep identifiers' case (column, schema and attributes). Note that attributes in Shapefile are all UPPERCASE.
| -i     | Coerce all integers to standard 32-bit integers, do not create 64-bit bigints, even if the DBF header signature appears to warrant it. |
| -I     | Create a GiST index on the geometry column. |
| -m \<a\_file\_name\> | Specify a file containing a set of mappings of (long) column names to 10 character DBF column names. The content of the file is one or more lines of two names separated by white space and no trailing or leading space. i.e. `COLUMNNAME DBFFIELD1` <br/> `AVERYLONGCOLUMNNAME DBFFIELD2` |
| -S     | Generate simple geometries instead of MULTI geometries. Will only succeed if all the geometries are actually single (I.E. a MULTIPOLYGON with a single shell, or or a MULTIPOINT with a single vertex). |
| -t \<dimensionality\> | Force the output geometry to have the specified dimensionality. Use the following strings to indicate the dimensionality: 2D, 3DZ, 3DM, 4D. <br/> If the input has fewer dimensions that specified, the output will have those dimensions filled in with zeroes. If the input has more dimensions that specified, the unwanted dimensions will be stripped. |
| -w     | Output WKT format, instead of WKB. Note that this can introduce coordinate drifts due to loss of precision. |
| -e     | Execute each statement on its own, without using a transaction. This allows loading of the majority of good data when there are some bad geometries that generate errors. Note that this cannot be used with the -D flag as the "dump" format always uses a transaction. |
| -W \<encoding\> | Specify encoding of the input data (dbf file). When used, all attributes of the dbf are converted from the specified encoding to UTF8. The resulting SQL output will contain a SET CLIENT_ENCODING to UTF8 command, so that the backend will be able to reconvert from UTF8 to whatever encoding the database is configured to use internally. |
| -N \<policy\> | NULL geometries handling policy (insert,skip,abort) |
| -n      | Only import DBF file. If your data has no corresponding shapefile, it will automatically switch to this mode and load just the dbf. So setting this flag is only needed if you have a full shapefile set, and you only want the attribute data and no geometry. |
| -G      | Use geography type instead of geometry (requires longitude/latitude data) in WGS84 long lat (SRID=4326) |
| -T \<tablespace\> | Specify the tablespace for the new table. Indexes will still use the default tablespace unless the -X parameter is also used. The PostgreSQL documentation has a good description on when to use custom tablespaces. |
| -X \<tablespace\> | Specify the tablespace for the new table's indexes. This applies to the primary key index, and the GIST spatial index if -I is also used. |

An example session using the loader to create an input file and uploading it might look like this:

``` sql
shp2pgsql -c -D -s 4269 -i -I <shape-file> <schema-name>.<table-name> > <sql-file>
```
``` sql
psql -d <database-name> -f <sql-file>
```

A conversion and upload can be done all in one step using UNIX pipes:

``` sql
shp2pgsql <shape-file> <schema-name>.<table-name> | psql -d <database-name>
```

## About the Demo Datasets

- [NYC](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#nyc-dataset)
- [London](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#london-dataset)

### NYC Dataset
- [nyc\_census\_blocks](https://github.com/cantzakas/postgis-demo/blob/master/data/nyc/nyc_census_blocks.md); a census block is the smallest geography for which census data is reported. Data Type: Polygon Data and additional structured  information. Supply Format: Shapefile.
- [nyc\_neighborhoods](https://github.com/cantzakas/postgis-demo/blob/master/data/nyc/nyc_neighborhoods.md): neighborhoods are social constructs that do not follow lines laid down by the government. Data Type: Polygon Data and additional structured information. Supply Format: Shapefile.
- [nyc\_streets](https://github.com/cantzakas/postgis-demo/blob/master/data/nyc/nyc_streets.md): The street centerlines form the transportation network of the city. Data Type: Polygon Data and additional structured (numeric) information. Supply Format: Shapefile.
- [nyc\_subway\_stations](https://github.com/cantzakas/postgis-demo/blob/master/data/nyc/nyc_subway_stations.md): information for the public transportation system of NYC. Data Type: Polygon Data and additional structured information. Supply Format: Shapefile.
- [nyc\_census\_sociodata](https://github.com/cantzakas/postgis-demo/blob/master/data/nyc/nyc_census_sociodata.md): rich collection of social-economic data collected during the census process, but only at the larger geography level of census tract. Data Type: Structured information. Supply Format: CSV.

### London DataSet
- Ordnance Survey Open Data:
  - [Code-Point® Open](data/london/cpo.md) gives you a precise geographic location for each postcode unit in Great Britain. Data type: Point Data. Supply Format: CSV. 
  - [Boundary-Line™](data/london/boundary-line.md) maps every administrative boundary in Great Britain, down to the level of council wards. Data type: Vector. Supply Format: ESRI© Shape, MapInfo© Tab.
  - [OS Open Names](data/london/oso-names.md) is a comprehensive dataset of place names, roads numbers and postcodes for Great Britain. Data type: . Supply Format: .
  - [OS Open Roads](data/london/oso-roads.md) gives you a high-level view of the British road network, from motorways to country lanes. Data type: . Supply Format: .
  - [OS Open Greenspace](data/london/oso-greenspace.md) contains the location and extent of spaces such as parks and sports facilities that are likely to be accessible to the public. Data type: Vector. Supply format: GML 3, ESRI© Shape.
  - [OS Open Rivers](data/london/oso-rivers.md) gives you a high-level view of the British river network, showing how all the different watercourses join up. Data type: . Supply Format: .
- TfL free Transport Data Service:

## Loading the Demo Datasets into Greenplum

### Loading the NYC Dataset
This guide is using this [data bundle](http://files.boundlessgeo.com/workshopmaterials/postgis-workshop-201401.zip), download it and extract to a convenient location. Inside the data bundle, you will find **data/**, a directory containing the shapefiles we will be loading. 

All the data in this package is public domain and freely redistributable. All the software in the package is open source, and freely redistributable. This workshop is licensed as Creative Commons [“share alike with attribution”](http://creativecommons.org/licenses/by-sa/3.0/us/), and is freely redistributable under the terms of that license.

To load the demo dataset for this demo, we will use the `shp2pgsql` utility, which was described [previously](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#shp2pgsql-using-the-esri-shapefile-loader).

The demo dataset contains GIS/Geospatial information for 5 different entities:

- nyc\_census\_blocks,
- nyc\_neighborhoods,
- nyc\_streets,
- nyc\_subway\_stations, and
- nyc\_census\_sociodata

For first 4 of the above (***nyc\_census\_blocks***, ***nyc\_neighborhoods***, ***nyc\_streets***, ***nyc\_subway\_stations***) we will use the `shp2pgsql` utility, to create a table in the Greenplum Database, prepare the `INSERT` statements which would load the data into this table and finally create an index on the geometry column of each table, as shown here:

``` shell
shp2pgsql -c -D -s 26918 -i -I nyc_census_blocks.shp public.nyc_census_blocks > nyc_census_blocks.sql
```
``` shell
shp2pgsql -c -D -s 26918 -i -I nyc_neighborhoods.shp public.nyc_neighborhoods > nyc_neighborhoods.sql
```
``` shell
shp2pgsql -c -D -s 26918 -i -I nyc_streets.shp public.nyc_streets > nyc_streets.sql
```
``` shell
shp2pgsql -c -D -s 26918 -i -I nyc_subway_stations.shp public.nyc_subway_stations > nyc_subway_stations.sql

```

Then using the `psql` utility, we execute each of the above ``sql`` files produced against the database, as shown here:

``` shell
psql -d nyc -U gpadmin -f nyc_census_blocks.sql
```
``` shell
psql -d nyc -U gpadmin -f nyc_neighborhoods.sql
```
``` shell
psql -d nyc -U gpadmin -f nyc_streets.sql
```
``` shell
psql -d nyc -U gpadmin -f nyc_subway_stations.sql

```

To load ***nyc\_census\_sociodata*** data, use the [nyc\_census\_sociodata.sql](/load/nyc/nyc_census_sociodata.sql) file provided.

**Note:**
When using either ``-D`` (use the PostgreSQL "dump" format for the output data) or ``-I`` (create a GiST index on the geometry column) flag, ``shp2pgslq`` utility is instructed to create an index on the geometry column defined on the target database table by issuing SQL statements of the

```sql
CREATE INDEX ON "<schema_name>"."<table_name>" 
	USING GIST ("<column_name>");
``` 

format. Such SQL statements throw a syntac error when executed againsts a Greenplum Database which only supports creation of named indexes. To work-around this issue, it is suggested that manual edit the ``sql`` files produced and use a unique name for each index, i.e.

``` sql
CREATE INDEX "<schema_name>"."<index_name>" ON "<schema_name>"."<table_name>" 
	USING GIST ("<column_name>");
```

# Practical Examples & Exercises
- [Pivotal Greenplum & PostGIS Basics](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#pivotal-greenplum--postgis-basics)
- [Spatial Geometries & Relationships](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#spatial-geometries--relationships)
- [Spatial Joins](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#spatial-joins)

## Pivotal Greenplum & PostGIS Basics

SQL or 'Structured Query Language', is a means of asking questions of, and updating data in, relational databases and is the defacto lingua franca used in the databases world. Standard, ANSI-compliant SQL will be used throughout the exercises described in this "Getting Started" guide, with Greenplum-specific extension only when absolutely required.

Let's start with some basic, Greenplum and PostGIS examples:

1. **"Which version of Greenplum Database software, am I running on the cluster?"**
	``` sql
	SELECT version();
	```
	
	Alternatively, the **`psql`** command utility can be used for the same, as following:
	
	``` sql
	psql -d <database-name> -c "SELECT version();"
	```
	
	In both cases, the query result would be similar to:
	
	| version |
	| :---    |
	| PostgreSQL 8.3.23 (Greenplum Database 5.10.2 build commit:b3c02f3acd880e2d676dacea36be015e4a3826d4) on x86_64-pc-linux-gnu, compiled by GCC gcc (GCC) 6.2.0, 64-bit compiled on Aug 10 2018 07:30:24 |
	| (1 row) |
	
2. **"Which version of PostGIS extension, am I running on the Greenplum Database cluster?"** 

	``` sql
	SELECT postgis_full_version();
	```
	
	| version |
	| :---    |
	| POSTGIS="2.1.5 r13152" GEOS="3.4.2-CAPI-1.8.2 r3921" PROJ="Rel. 4.8.0, 6 March 2012" GDAL="GDAL 1.11.1, released 2014/09/24" LIBXML="2.7.6" LIBJSON="UNKNOWN" RASTER |
	| (1 row) |
	
3. **“What is the population of the City of New York?”**

	``` sql
	SELECT
		SUM(popn_total) AS population
	FROM nyc_census_blocks;
	```
	
	| population |
	| :---    |
	| 8,175,032.00 |
	| (1 row) |
	
4. **“What is the population of the Bronx?”**

	``` sql
	SELECT 
		SUM(popn_total) AS population
	FROM
		nyc_census_blocks
	WHERE
		boroname = 'The Bronx';
	```
	
	| population |
	| :---    |
	| 1,385,108.00 |
	| (1 row) |
	
5. **“For each borough, what percentage of the population is white?”**

	``` sql
	SELECT
		boroname,
		100 * Sum(popn_white)/Sum(popn_total) AS white_pct
	FROM
		nyc_census_blocks
	GROUP BY
		boroname;
	```
	
	| boroname      | white_pct                                |
	| :------------ | :----------------- |
	| Queens        | 39.72207739459101  |
	| Brooklyn      | 42.80117379326865  |
	| Manhattan     | 57.44930394804628  |
	| Staten Island | 72.8942034860154   |
	| The Bronx     | 27.903744689944755 |
	| (5 rows)      |

6. **What is the geometric representation of 'Atlantic Commons' street?**

	``` sql
	SELECT ST_AsText(geom)
	FROM nyc_streets
	WHERE name = 'Atlantic Commons';
	```
	
	| st_astext |
	| :---    |
	| MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701)) |
	| (1 row) |

## Spatial Geometries & Relationships

Geometry Data Type Collections were described earlier in more detail; they are useful for directly modeling real world objects as spatial objects. Some typical operations on Collections include:

- **`ST_NumGeometries(geometry)`**, returns the number of parts in the collection.
- **`ST_GeometryN(geometry,n)`**, returns the specified part.
- **`ST_Area(geometry)`**,  returns the total area of all polygonal parts.
- **`ST_Length(geometry)`**, returns the total length of all linear parts.

Spatial databases are extremely powerful tools, not only because they can store geometry information but also because they have the ability to compare relationships between geometries. Questions like "Which are the closest bike racks to a park?" or “Where are the intersections of subway lines and streets?” can only be answered by comparing geometries representing the bike racks, streets, and subway lines. Some typical operations on comparing geometries include:

- **`ST_Intersects`**, returns **TRUE** if the two shapes have any space in common, i.e., if their boundaries or interiors intersect.
- **`ST_Disjoint`**, the opposite of **`ST_Intersects`**. If two geometries are disjoint, they do not intersect, and vice-versa. In fact, it is often more efficient to test “not intersects” than to test “disjoint” because the intersects tests can be spatially indexed, while the disjoint test cannot.
- **`ST_Crosses`**. For multipoint/polygon, multipoint/linestring, linestring/linestring, linestring/polygon, and linestring/multipolygon comparisons, `**ST_Crosses(geometry A, geometry B)`** returns **TRUE** if the intersection results in a geometry whose dimension is one less than the maximum dimension of the two source geometries and the intersection set is interior to both source geometries.
- **`ST_Overlaps`**, compares two geometries of the same dimension and returns **TRUE** if their intersection set results in a geometry different from both but of the same dimension.
- **`ST_Touches`**, returns **TRUE** if either of the geometries’ boundaries intersect or if only one of the geometry’s interiors intersects the other’s boundary.
- **`ST_Within/ST_Contains`**, tests whether one geometry is fully within the other.

An extremely common GIS question is ***"find all the stuff within distance X of this other stuff"***. The **`ST_Distance`** function calculates the shortest distance between two geometries and returns it as a float. This is useful for actually reporting back the distance between objects.

On a similar note, for testing whether two objects are within a distance of one another, the **`ST_DWithin`** function provides an index-accelerated true/false test. This is useful for questions like ***“how many X are within N meters of Z?”***. The advantage of this function, is that one doesn’t have to calculate an actual buffer but test the distance relationship.

Let's see some more examples:

1. **"What is the area of the ‘West Village’ neighborhood?"**
	``` sql
	SELECT ST_Area(geom)
	FROM nyc_neighborhoods
	WHERE name = 'West Village';
	```
	
	| st_area              |
	| :---                 |
	| 1,044,614.5296485956 |
	| (1 row)              |
	
2. **"What is the total length of streets (in kilometers) in New York City?"**

	``` sql
	SELECT SUM(ST_Length(geom)) / 1000 AS length
	FROM nyc_streets;
	```
	
	| length             |
	| :---               |
	| 10418.904717200041 |
	| (1 row)            |
	
3. **"What is the length of streets in New York City, summarized by type?"**
	
	``` sql
	SELECT type, Sum(ST_Length(geom)) AS length
	FROM nyc_streets
	GROUP BY type
	ORDER BY length DESC;
	```
	
	| type                                             | length             |
	| :----------------------------------------------- | :----------------- |
	| residential                                      | 8629870.337866072  |
	| motorway                                         | 403622.4781263625  |
	| tertiary                                         | 360394.87905130273 |
	| motorway_link                                    | 294261.4194796685  |
	| secondary                                        | 276264.30389792577 |
	| unclassified                                     | 166936.3716044582  |
	| primary                                          | 135034.23301794694 |
	| footway                                          | 71798.48783780968  |
	| service                                          | 28337.635038595996 |
	| trunk                                            | 20353.58198260764  |
	| cycleway                                         | 8863.751448259294  |
	| pedestrian                                       | 4867.050328250255  |
	| construction                                     | 4803.081621035618  |
	| residential; motorway_link                       | 3661.5750629374543 |
	| trunk_link                                       | 3202.189812402008  |
	| primary_link                                     | 2492.5745708353616 |
	| living_street                                    | 1894.6390545733245 |
	| primary; residential; motorway_link; residential | 1367.7657694133486 |
	| undefined                                        | 380.5386191034604  |
	| steps                                            | 282.74522134212725 |
	| motorway_link; residential                       | 215.07778911517033 |
	| (21 rows)                                        |                    |
	
4. **"What is the geometric representation of Broad Street subway station and then determine its neighborhood using the ST_Intersects function."**
	
	``` sql
	SELECT name, ST_AsText(geom)
	FROM nyc_subway_stations
	WHERE name = 'Broad St';
	```
	
	| name     | st_astext                                |
	| :------- | :--------------------------------------- |
	| Broad St | POINT(583571.905921312 4506714.34119218) |
	| (1 row)                                             |
	
	``` sql
	SELECT name || ', ' || boroname AS name
	FROM nyc_neighborhoods
	WHERE ST_Intersects(
		geom, 
		ST_GeomFromText('POINT(583571.905921312 4506714.34119218)',26918) -- geometric representation of 'Brad Street subway station'
	);
	```
	
	| name                          |
	| :---------------------------- |
	| Financial District, Manhattan |
	| (1 row)                       |

5. **"Which streets are nearby (within 10 meters of) Brad Street subway station?"**
	
	``` sql
	SELECT str.name
	FROM nyc_streets str
	WHERE ST_DWithin(
		str.geom, 
		ST_GeomFromText('POINT(583571.905921312 4506714.34119218)',26918), -- geometric representation of 'Brad Street subway station'
		10);
	```
	
	| name      |
	| :-------- |
	| Broad St  |
	| Wall St   |
	| Nassau St |
	| (3 rows)  |

6. **"What is the geometric representation of Atlantic Commons?"**

	``` sql
	SELECT ST_AsText(geom)
	FROM nyc_streets
	WHERE name = 'Atlantic Commons';
	```
	
	| st_astext                                                                            |
	| :----------------------------------------------------------------------------------- |
	| MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701)) |
	| (1 row)                                                                              |

7. **"What neighborhood and borough is 'Atlantic Commons' street in?"**

	``` sql
	SELECT nb.name || ', ' || nb.boroname AS name
	FROM nyc_neighborhoods nb
	WHERE ST_Intersects(
		nb.geom, 
		ST_GeomFromText('MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701))',26918) -- geometric representation of 'Atlantic Commons' street
	);
	```
	
	| name                  |
	| :-------------------- |
	| Fort Green, Brooklyn  |
	| (1 row)               |

8. **"What streets does 'Atlantic Commons' street joins with?"**

	``` sql
	SELECT str.name
	FROM nyc_streets str
	WHERE ST_DWithin(
		str.geom, 
		ST_GeomFromText('MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701))',26918), -- geometric representation of 'Atlantic Commons' street
		0.1);
	```
	
	| name             | 
	| :--------------- |
	| S Oxford St      |
	| Cumberland St    |
	| Atlantic Commons |
	| (3 rows)         |
  
9. **"Approximately how many people live on (within 50 meters of) 'Atlantic Commons' street?"**

  	``` sql
  	SELECT SUM(census.popn_total)
	FROM nyc_census_blocks census
	WHERE ST_DWithin(
		census.geom, 
		ST_GeomFromText('MULTILINESTRING((586781.701577724 4504202.15314339,586863.51964484 4504215.9881701))',26918), -- geometric representation of 'Atlantic Commons' street
		50);
	```
	
  	| name     |
  	| :------- |
  	| 27452858 |
  	| (1 row)  |
  	
## Spatial Joins

Spatial joins allow you to combine information from different tables by using spatial relationships as the join key. Much of what we think of as “standard GIS analysis” can be expressed as spatial joins.

In the previous section, we explored spatial relationships using a 2-step process: first we extracted a subway station point for ‘Broad St’; then, we used that point to ask further questions such as “what neighborhood is the ‘Broad St’ station in?”.

Any function that provides a true/false relationship between two tables can be used to drive a spatial join, but the most commonly used ones are: **`ST_Intersects`**, **`ST_Contains`**, and **`ST_DWithin`**.

Using a spatial join, we can answer the question in one step, retrieving information about the subway station and the neighborhood that contains it. The combination of a JOIN with a GROUP BY provides the kind of analysis that is usually done in a GIS system. Here are some examples of the queries described in previous section, expressed as Spatial Joins, plus some additional new examples:

1. **(Spatial Join) "In which neighborhood, is Brad Street subway station located?"**
	
	``` sql
	SELECT
		subways.name AS subway_name,
		neighborhoods.name AS neighborhood_name,
		neighborhoods.boroname AS borough
	FROM nyc_neighborhoods AS neighborhoods
		JOIN nyc_subway_stations AS subways
		ON ST_Contains(
			neighborhoods.geom, 
			subways.geom)
	WHERE
		subways.name = 'Broad St';
	```
	
	| subway_name | neighborhood_name  | name      |
	| :---------- | ------------------ | --------- |
	| Broad St    | Financial District | Manhattan |
	| (1 row)     |

2. **(Spatial Join) "Which streets are nearby (within 10 meters of) Brad Street subway station?"**
	
	``` sql
	SELECT str.name
	FROM nyc_streets str
		JOIN nyc_subway_stations sta
			ON ST_DWithin(
				str.geom, 
  				sta.geom, 
  				10)
  	WHERE
  		sta.name = 'Broad St';
  	```
	
	| name      |
  	| :-------- |
  	| Broad St  |
  	| Wall St   |
  	| Nassau St |
  	| (3 rows)  |

3. **(Spatial Join) "What neighborhood and borough is 'Atlantic Commons' street in?"**

	``` sql
	SELECT nb.name, nb.boroname
	FROM nyc_neighborhoods nb
		JOIN nyc_streets str
			ON ST_Intersects(
				nb.geom,
				str.geom)
	WHERE
		str.name = 'Atlantic Commons';
	```
	
	| name       | boroname |
	| :----------| :--------|
	| Fort Green | Brooklyn |
	| (1 row) |

4. **(Spatial Join) "What streets does 'Atlantic Commons' street joins with?"**

	``` sql
	SELECT str1.name
	FROM nyc_streets str1, nyc_streets str2
	WHERE str2.name = 'Atlantic Commons'
		AND ST_DWithin(
			str1.geom,
			str2.geom, 
			0.1);
	```
	
	| name             |
	| :----------------|
	| S Oxford St      |
	| Cumberland St    |
	| Atlantic Commons |
	| (3 rows)         |
	
5. **(Spatial Join) "Approximately how many people live on (within 50 meters of) 'Atlantic Commons' street?"**

	``` sql
	SELECT str1.name
	FROM nyc_streets str1, nyc_streets str2
	WHERE ST_DWithin(
		str1.geom,
		str2.geom, 
		0.1)
	AND
		str2.name = 'Atlantic Commons';
	```
  	
  	| name     |
  	| :------- |
  	| 27452858 |
  	| (1 row)  |

6. **(Spatial Join) "What is the population and racial make-up of the neighborhoods of Manhattan?"**

	``` sql
	SELECT
		neighborhoods.name AS neighborhood_name,
		SUM(census.popn_total) AS population,
		100.0 * SUM(census.popn_white) / SUM(census.popn_total) AS white_pct,
		100.0 * SUM(census.popn_black) / SUM(census.popn_total) AS black_pct
	FROM
		nyc_neighborhoods AS neighborhoods
		JOIN nyc_census_blocks AS census
		ON ST_Intersects(
			neighborhoods.geom, 
			census.geom)
	WHERE
		neighborhoods.boroname = 'Manhattan'
	GROUP BY 
		neighborhoods.name
	ORDER BY
		white_pct DESC;
	```
  	
  	| neighborhood_name   | population | white_pct | black_pct |
  	| :------- | :------- | :------- | :------- |
  	| Carnegie Hill | 18763 | 90.08154346319886 | 1.4123541011565315 |
  	| West Village | 26718 | 87.59637697432443 | 2.1745639643685903 |
  	| North Sutton Area | 22460 | 87.56455921638468 | 1.553873552983081 |
  	| Upper East Side | 203741 | 85.02216048807064 | 2.7220834294520984 |
  	| Soho | 15436 | 84.64628142005701 | 2.235034983156258 |
  	| Greenwich Village | 57224 | 81.97609394659584 | 2.43778834055641 |
  	| Central Park | 46600 | 79.49356223175965 | 7.967811158798283 |
  	| Tribeca | 20908 | 79.1180409412665 | 3.548880811172757 |
  	| Gramercy | 104876 | 75.4586368663946 | 4.720813150768526 |
  	| Murray Hill | 29655 | 75.01264542235711 | 2.5122239082785365 |
  	| Chelsea | 61340 | 74.81578089338116 | 6.372676882947506 |
  	| Upper West Side | 214761 | 74.561489283436 | 9.188353565125885 |
  	| Midtown | 76840 | 72.60150963040083 | 5.166579906298803 |
  	| Battery Park | 17153 | 71.8300005829884 | 3.375502827493733 |
  	| Financial District | 34807 | 69.92846266555578 | 3.829689430287011 |
  	| Clinton | 32201 | 65.2743703611689 | 7.943852675382752 | 
  	| East Village | 82266 | 63.26550458269516 | 8.771545960664186 |
  	| Garment District | 10539 | 55.18550147072777 | 7.08795900939368 |
  	| Morningside Heights | 42844 | 52.719167211278126 | 19.370273550555503 |
  	| Little Italy | 12568 | 49.029280712921704 | 1.8220878421387652 |
  	| Yorkville | 58450 | 35.5551753635586 | 29.72284003421728 |
  	| Inwood | 50047 | 35.21489799588387 | 16.846164605271046 |
  	| Washington Heights | 169013 | 34.873057102116405 | 16.827107973942834 |
  	| Lower East Side | 96156 | 33.50908939639752 | 9.075876700361912 |
  	| East Harlem | 60576 | 26.43621236133122 | 40.38398045430534 |
  	| Hamilton Heights | 67432 | 23.889251393996915 | 35.772333610155414 |
  	| Chinatown | 16209 | 15.16441483126658 | 3.757171941513974 |
  	| Harlem | 134955 | 15.094661183357415 | 67.06161313030269 |
  	| (28 row)s |

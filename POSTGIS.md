# About PostGIS
PostGIS is a spatial database extension for PostgreSQL that allows GIS (Geographic Information Systems) objects to be stored in the database. The Greenplum Database PostGIS extension includes support for GiST-based R-Tree spatial indexes and functions for analysis and processing of GIS objects.

The Greenplum Database PostGIS extension supports the optional PostGIS raster data type and most PostGIS Raster functions. With the PostGIS Raster objects, PostGIS geometry data type offers a single set of overlay SQL functions (such as ST_Intersects) operating seamlessly on vector and raster geospatial data. PostGIS Raster uses the GDAL (Geospatial Data Abstraction Library) translator library for raster geospatial data formats that presents a [single raster abstract data model to a calling application](http://www.gdal.org/gdal_datamodel.html).

For information about PostGIS, see http://postgis.refractions.net/

For information about GDAL, see http://www.gdal.org.

## Greenplum PostGIS Extension
The Greenplum Database PostGIS extension package is available from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb). You can install the package using the Greenplum Package Manager (gppkg). For details, see ***gppkg*** in the Greenplum Database Utility Guide.

Greenplum Database supports the PostGIS extension with these component versions.
- PostGIS 2.1.5
- Proj 4.8.0
- Geos 3.4.2
- GDAL 1.11.1
- Json 0.12
- Expat 2.1.0

## Enabling PostGIS Support
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

## Greenplum Database PostGIS Extension Support & Limitations
- [Supported PostGIS Data Types](https://github.com/cantzakas/postgis-demo/new/master#supported-postgis-data-types)
- [Supported PostGIS Index](https://github.com/cantzakas/postgis-demo/new/master#supported-postgis-index)
- [Supported PostGIS Raster Data Types](https://github.com/cantzakas/postgis-demo/new/master#supported-postgis-raster-data-types)
- [PostGIS Extension Limitations](https://github.com/cantzakas/postgis-demo/new/master#postgis-extension-limitations)

The Greenplum Database PostGIS extension does not support the following features:
- Topology
- Some Raster Functions

### Supported PostGIS Data Types
Greenplum Database PostGIS extension supports these PostGIS data types:
- box2d
- box3d
- geometry
- geography

### Supported PostGIS Raster Data Types
Greenplum Database PostGIS supports these PostGIS Raster data types:
- geomval
- addbandarg
- rastbandarg
- raster
- reclassarg
- summarystats
- unionarg

### Supported PostGIS Index
Greenplum Database PostGIS extension supports the GiST (Generalized Search Tree) index.

### PostGIS Extension Limitations
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

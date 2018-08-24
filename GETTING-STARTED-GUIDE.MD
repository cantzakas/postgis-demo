# Getting Started Guide
- [Purpose](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#purpose)
- [Bill of Materials](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#bill-of-materials)
- [Disclaimer](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#Disclaimer)
- [Instructions](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#Instructions)
- [Exercises](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#Exercises)

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
- [PostGIS Extension for Greenplum Database](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#postgis-extension-for-greenplum-database)
- [Geometries](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#geometries)
- [How to Load GIS (Vector) Data](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#how-to-load-gis-vector-data)
- [About the Demo Dataset](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#about-the-demo-dataset)
- [Loading the Demo Data into a Pivotal Greenplum Database](https://github.com/cantzakas/postgis-demo/blob/master/GETTING-STARTED-GUIDE.MD#loading-the-demo-data-into-a-pivotal-greenplum-database)

### Greenplum Database
Read [Welcome to Pivotal Greenplum Database](GPDB.md) page for information on Greenplum Database.
### PostGIS Extension for Greenplum Database
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
Read [Geometries](GEOMETRIES.md) page for background information and better understanding on how a real world object is represented using PostGIS & SQL.
### How to Load GIS (Vector) Data
Find generic information on how to load GIS data into a Pivotal Greenplum database [here](HOWTO-LOAD-GIS-DATA.md) page.
### About the Demo Dataset
Read [About the demo dataset](ABOUTDATA.md) page for information on number of records and table attributes for the datasets used in this demo.
### Loading the Demo Data into a Pivotal Greenplum Database
Follow the detailed instructions available [here](LOAD-GIS-DATASETS-INTO-GPDB.md), on how to load the demo GIS datasets into a Pivotal Greenplum database.

## Modules/Exercises included in this demo
- [**Simple SQL exercises**](SIMPLE-SQL.md)
- [**Geo/PostGIS SQL**](GEO-POSTGIS-SQL.md)


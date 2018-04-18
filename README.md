# postgis-demo
Demo material to showcase use of PostGIS on top of [Pivotal](http://pivotal.io) [Greenplum Database](http://greenplum.org), build upon the work people at [Boundless](http://boundlessgeo.com/) have done, check their workshop material at https://github.com/boundlessgeo/workshops.

## Bill of Materials
- Software (available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
  - Greenplum Database Sandbox OVA for VMWare (version 5.7.0)
  - PostGIS 2.1.5+pivotal.1 for RHEL 6 extension package
- Data
  - This workshop uses a [data bundle](http://files.boundlessgeo.com/workshopmaterials/postgis-workshop-201401.zip). 

## Disclaimer
All the data in the package is public domain and freely redistributable. All the software in the package is open source, and freely redistributable. This workshop is licensed as Creative Commons [“share alike with attribution”](http://creativecommons.org/licenses/by-sa/3.0/us/), and is freely redistributable under the terms of that license.

## Greenplum Database
### About Greenplum Database
### Greenplum PostGIS Extension
#### About PostGIS
PostGIS is a spatial database extension for PostgreSQL that allows GIS (Geographic Information Systems) objects to be stored in the database. The Greenplum Database PostGIS extension includes support for GiST-based R-Tree spatial indexes and functions for analysis and processing of GIS objects.

The Greenplum Database PostGIS extension supports the optional PostGIS raster data type and most PostGIS Raster functions. With the PostGIS Raster objects, PostGIS geometry data type offers a single set of overlay SQL functions (such as ST_Intersects) operating seamlessly on vector and raster geospatial data. PostGIS Raster uses the GDAL (Geospatial Data Abstraction Library) translator library for raster geospatial data formats that presents a [single raster abstract data model to a calling application](http://www.gdal.org/gdal_datamodel.html).

For information about PostGIS, see http://postgis.refractions.net/

For information about GDAL, see http://www.gdal.org.

#### Greenplum PostGIS Extension
The Greenplum Database PostGIS extension package is available from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb). You can install the package using the Greenplum Package Manager (gppkg). For details, see ***gppkg*** in the Greenplum Database Utility Guide.

Greenplum Database supports the PostGIS extension with these component versions.
- PostGIS 2.1.5
- Proj 4.8.0
- Geos 3.4.2
- GDAL 1.11.1
- Json 0.12
- Expat 2.1.0

##### Enabling PostGIS Support
The Greenplum Database PostGIS extension contains the postgis_manager.sh script that installs or removes both the PostGIS and PostGIS Raster features in a database. After the PostGIS extension package is installed, the script is in $GPHOME/share/postgresql/contrib/postgis-2.1/. The postgis_manager.sh script runs SQL scripts that install or remove PostGIS and PostGIS Raster from a database.

Run the postgis_manager.sh` script specifying the database and with the install option to install PostGIS and PostGIS Raster. This example installs PostGIS and PostGIS Raster objects in the database mydatabase.
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

#### Greenplum Database PostGIS Limitations
The Greenplum Database PostGIS extension does not support the following features:

- Topology
- A small number of user defined functions and aggregates
- PostGIS long transaction support
- Geometry and geography type modifier
For information about Greenplum Database PostGIS support, see PostGIS Extension Support and Limitations.

## Loading GIS (Vector) Data into Pivotal Greenplum Database
To load GIS data into Pivotal Greenplum database, check the step-by-step instructions at [ESRI-Shapefile-Loader](ESRI-Shapefile-Loader.md).


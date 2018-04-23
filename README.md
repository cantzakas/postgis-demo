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

## Demo instructions
### Greenplum Database
Read [Welcome to Pivotal Greenplum Database](GPDB.md) page for information on Greenplum Database.
### Greenplum PostGIS Extension
Read [About PostGIS](POSTGIS.md) page for information on PostGIS Extension for Greenplum.
### Loading GIS (Vector) Data into Pivotal Greenplum Database
Follow the step-by-step instructions available at [GIS-loader file](GIS-loader.md) page, on how to load GIS data into Pivotal Greenplum database.

## About the data used in this demo
Read [About the data](ABOUTDATA.md) page for information on number of records and table attrinutes for the datasets used in this demo.

## Modules in this demo
### Simple SQL exercises
[Simple SQL](SIMPLE-SQL.md)
### Geometry (PostGIS) SQL exercises
[Geo/PostGIS SQL](GEO-POSTGIS-SQL.md)

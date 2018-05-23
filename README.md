# postgis-demo
Demo material to showcase use of PostGIS on top of [Pivotal](http://pivotal.io) [Greenplum Database](http://greenplum.org), build upon the work people at [Boundless](http://boundlessgeo.com/) have done, check their workshop material at https://github.com/boundlessgeo/workshops.

### Update ###
As of 25 May 2018, this demo has been updated vs. the [Boundless](http://boundlessgeo.com/) demo; now, the demo utilizes and presents data available and for the area of Greater London, UK.

## Bill of Materials
- Software (available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
  - Greenplum Database Sandbox OVA for VMWare (version 5.8.0)
  - PostGIS 2.1.5+pivotal.1 for RHEL 6 extension package
- Data
  - [Statistical GIS Boundary Files for London](https://data.london.gov.uk/dataset/statistical-gis-boundary-files-london); contains a range of key GIS boundary files for ESRI and Map Info covering Greater London and includes information on:
    - Output Area (OA) 2011,
    - Lower Super Output Area (LSOA) 2004 and 2011,
    - Middle Super Output Area (MSOA) 2004 and 2011,
    - London Wards, 
    - London Boroughs
  - [Full UK Postcode Latitude Longitude](https://www.freemaptools.com/download-uk-postcode-lat-lng.htm).
  - [TfL's free Transport Data Service](https://tfl.gov.uk/info-for/open-data-users/) information:

## Disclaimer
- [Statistical GIS Boundary Files for London](https://data.london.gov.uk/dataset/statistical-gis-boundary-files-london) 'contains National Statistics data © Crown copyright and database right [2015]' and 'contains Ordnance Survey data © Crown copyright and database right [2015]'.
- [Full UK Postcode Latitude Longitude](https://www.freemaptools.com/download-uk-postcode-lat-lng.htm) 'contains Ordnance Survey data © Crown copyright and database right 2017', 'contains Royal Mail data © Royal Mail copyright and database right 2017' and 'contains National Statistics data © Crown copyright and database right 2017'.
- [TfL's free Transport Data Service](https://tfl.gov.uk/info-for/open-data-users/) is 'Powered by TfL Open Data' and 'contains OS data © Crown copyright and database rights 2016'.
- All the software in the package is open source, and freely redistributable. 
- This workshop is licensed as Creative Commons [“share alike with attribution”](http://creativecommons.org/licenses/by-sa/3.0/us/), and is freely redistributable under the terms of that license.

## Instructions & Background Info
### Greenplum Database
Read [Welcome to Pivotal Greenplum Database](GPDB.md) page for information on Greenplum Database.
### Greenplum PostGIS Extension
Read [About PostGIS](POSTGIS.md) page for information on PostGIS Extension for Greenplum.
### Geometries
Read [Geometries](GEOMETRIES.md) page for background information and better understanding on how a real world object is represented using PostGIS & SQL.
### How to Load GIS (Vector) Data
Find generic information on how to load GIS data into a Pivotal Greenplum database [here](HOWTO-LOAD-GIS-DATA.md) page.
### About the Demo Dataset
Read [About the demo dataset](ABOUTDATA.md) page for information on number of records and table attrinutes for the datasets used in this demo.
### Loading the Demo Data into a Pivotal Greenplum Database
Follow the detailed instructions available [here](LOAD-DEMOGIS-INTO-GPDB.md), on how to load this demo GIS dataset into a Pivotal Greenplum database.

## Modules/Exercises included in this demo
- [**Simple SQL exercises**](SIMPLE-SQL.md)
- [**Geo/PostGIS SQL**](GEO-POSTGIS-SQL.md)

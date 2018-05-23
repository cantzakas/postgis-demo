# postgis-demo
Demo material to showcase use of PostGIS on top of [Pivotal](http://pivotal.io) [Greenplum Database](http://greenplum.org). The original demo was build upon the [work](https://github.com/boundlessgeo/workshops) people at [Boundless](http://boundlessgeo.com/) have done in the past, yet as of 25 May 2018, it has been updated and extended to utilize and present data available and for the area of Greater London, UK.

## Bill of Materials
- Software
  - Greenplum Database Sandbox OVA for VMWare (available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
  - PostGIS 2.1.5+pivotal.1 for RHEL 6 extension package (also available to download from [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb))
- Data
  - [Ordnance Survey Open Data](https://www.ordnancesurvey.co.uk/opendatadownload/products.html):
    - [Code-Point® Open](https://www.ordnancesurvey.co.uk/business-and-government/products/code-point-open.html); Code-Point Open gives you a precise geographic location for each postcode unit in Great Britain. Data type: Point Data. Supply format: CSV.
    - [Boundary-Line™](https://www.ordnancesurvey.co.uk/business-and-government/products/boundary-line.html); Boundary-Line maps every administrative boundary in Great Britain, down to the level of council wards. Data type: Vector. Supply format: ESRI© Shape, MapInfo© Tab.
    - [OS Open Greenspace](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-greenspace.html); OS Open Greenspace contains the location and extent of spaces such as parks and sports facilities that are likely to be accessible to the public. Data type: Vector. Supply format: GML 3, ESRI© Shape.
    - [OS Open Names](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-names.html); OS Open Names is a comprehensive dataset of place names, roads numbers and postcodes for Great Britain.
    - [OS Open Roads](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-roads.html); OS Open Roads gives you a high-level view of the British road network, from motorways to country lanes.
    - [OS Open Rivers](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-rivers.html); OS Open Rivers gives you a high-level view of the British river network, showing how all the different watercourses join up.
  - [TfL's free Transport Data Service](https://tfl.gov.uk/info-for/open-data-users/) information:

## Disclaimer
- Use of Ordnance Survey data is subject to terms at www.ordnancesurvey.co.uk/opendata/licence. Contains Ordnance Survey data © Crown copyright and database right 2018. Contains Royal Mail data © Royal Mail copyright and database right 2018. Contains National Statistics data © Crown copyright and database right 2018.
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

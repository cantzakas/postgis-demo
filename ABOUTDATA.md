# About the data used on this demo
The data for this workshop is CSV and shapefiles for the area of Greater London, United Kingdom which are available via either [Ordnance Survey Open Data](http://www.os.uk/oswebsite/opendata/index.html) or [Transport for London (TfL) Open Data](https://tfl.gov.uk/info-for/open-data-users/)

The following pages give a quick background on the data each set holds, describe their attributes, give metadata information (i.e. number of records, update cycle, etc) and finallym provide additional URL links for further reading.

# Datasets
## London (updated dataset)
- [Ordnance Survey Open Data](https://www.ordnancesurvey.co.uk/opendatadownload/products.html):
  - [Code-Point® Open](https://www.ordnancesurvey.co.uk/business-and-government/products/code-point-open.html); [Code-Point® Open](data/london/cpo.md) gives you a precise geographic location for each postcode unit in Great Britain. Data type: Point Data. Supply format: CSV. 
  - [Boundary-Line™](https://www.ordnancesurvey.co.uk/business-and-government/products/boundary-line.html); [Boundary-Line™](data/london/boundary-line.md) maps every administrative boundary in Great Britain, down to the level of council wards. Data type: Vector. Supply format: ESRI© Shape, MapInfo© Tab.
  - [OS Open Names](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-names.html); [OS Open Names](data/london/oso-names.md) is a comprehensive dataset of place names, roads numbers and postcodes for Great Britain.
  - [OS Open Roads](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-roads.html); [OS Open Roads](data/london/oso-roads.md) gives you a high-level view of the British road network, from motorways to country lanes.
  - [OS Open Greenspace](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-greenspace.html); [OS Open Greenspace](data/london/oso-greenspace.md) contains the location and extent of spaces such as parks and sports facilities that are likely to be accessible to the public. Data type: Vector. Supply format: GML 3, ESRI© Shape.
  - [OS Open Rivers](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-rivers.html); [OS Open Rivers](data/london/oso-rivers.md) gives you a high-level view of the British river network, showing how all the different watercourses join up.
- [TfL's free Transport Data Service](https://tfl.gov.uk/info-for/open-data-users/) information:
## NYC (original dataset)
The data for this workshop is four shapefiles for New York City, and one attribute table of sociodemographic variables. We’ve loaded our shapefiles as PostGIS tables and will add sociodemographic data later in the workshop. The following describes the number of records and table attributes for each of our datasets. These attribute values and relationships are fundamental to our future analysis.
- [nyc\_census\_blocks](data/nyc/nyc_census_blocks.md); a census block is the smallest geography for which census data is reported. All higher level census geographies (block groups, tracts, metro areas, counties, etc) can be built from unions of census blocks. We have attached some demographic data to our collection of blocks.

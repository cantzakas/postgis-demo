# About the data used on this demo
The data for this workshop is four shapefiles for New York City, and one attribute table of sociodemographic variables. We’ve loaded our shapefiles as PostGIS tables and will add sociodemographic data later in the workshop.

The following describes the number of records and table attributes for each of our datasets. These attribute values and relationships are fundamental to our future analysis.

## statistical-gis-boundaris-london

### 
A census block is the smallest geography for which census data is reported. All higher level census geographies (block groups, tracts, metro areas, counties, etc) can be built from unions of census blocks. We have attached some demographic data to our collection of blocks.

| Field | Description |
| :---- | :--- |
| blkid | A 15-digit code that uniquely identifies every census block. Eg: 360050001009000 |
| popn_total | Total number of people in the census block |
| popn_white | Number of people self-identifying as “White” in the block |
| popn_black | Number of people self-identifying as “Black” in the block |
| popn_nativ | Number of people self-identifying as “Native American” in the block |
| popn_asian | Number of people self-identifying as “Asian” in the block |
| popn_other | Number of people self-identifying with other categories in the block |
| boroname | Name of the New York borough. Manhattan, The Bronx, Brooklyn, Staten Island, Queens |
| geom | Polygon boundary of the block |

Number of records: 36592

**Note:** To get census data into GIS, you need to join two pieces of information: the actual data (text), and the boundary files (spatial). There are many options for getting the data, including downloading data and boundaries from the Census Bureau’s [American FactFinder](http://factfinder.census.gov/).

## Full UK Postcode Latitude Longitude

### ukpostcodes.zip (CSV format, 33MB zipped, 96MB unzipped)
Postal codes used in the United Kingdom are known as postcodes. They are alphanumeric and were adopted nationally between 11 October 1959 and 1974, having been devised by the GPO (Royal Mail). The structure of a postcode is a one or two-letter postcode area code named after a local city, town or area of London, one or two digits signifying a district in that region, a space, and then an arbitrary code of one number and two letters. 

For example, the postcode of the University of Roehampton in London is SW15 5PU, where SW stands for south-west London. The postcode of GCHQ is GL51 0EX, where GL signifies the postal area of Gloucester. The postal town refers to a wide area and does not relate to a specific town, county or region. GL51 is one of the postcodes for the town of Cheltenham (in Gloucestershire) which is where GCHQ is located.

| Field | Description |
| :---- | :--- |
| **id** | An integer that matches a unique postcode. _Eg: 1, 2, 3, etc._ |
| **postcode** | The postal codes used in the United Kingdom; designates an area with a number of addresses or a single major delivery point. _Eg. AB10, EC1V 9NR, E2 8HR, etc._|
| **latitude** | The geographic coordinate that specifies the north–south position of a point on the Earth's surface for the UK postcode. _Eg. 53.536191000000000, 51.525169000000000, etc._ |
| **longitude** | The geographic coordinate that specifies the east-west position of a point on the Earth's surface for the UK postcode. _Eg. -0.090486166347876, -0.075045341739029, etc._ |

Number of records: 1762398

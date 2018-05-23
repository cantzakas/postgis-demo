# About the data used on this demo
The data for this workshop is CSV and shapefiles for the area of Greater London, United Kingdom which are available via either [Ordnance Survey Open Data](http://www.os.uk/oswebsite/opendata/index.html) or [Transport for London (TfL) Open Data](https://tfl.gov.uk/info-for/open-data-users/)

The following paragraphs describe the table attributes for each of our datasets and number of records (as of May 2018).

## Ordnance Survey Open Data

### Code-Point® Open
Code-Point Open gives you a precise geographic location for each postcode unit in Great Britain. 

Postal codes used in the United Kingdom are known as postcodes. They are alphanumeric and were adopted nationally between 11 October 1959 and 1974, having been devised by the GPO (Royal Mail). The structure of a postcode is a one or two-letter postcode area code named after a local city, town or area of London, one or two digits signifying a district in that region, a space, and then an arbitrary code of one number and two letters. 

Data type: Point Data. 

Supply format: CSV.

| Field | Description |
| :---- | :--- |
| **pc** | Postcode |
| **pq** | Postitional quality indicator |
| **ea** | Eastings |
| **no** | Northings |
| **cy** | Country code |
| **rh** | NHS regional HA code |
| **lh** | NHS HA code |
| **cc** | Admin county code |
| **dc** | Admin district code |
| **wc** | Admin ward code |

Number of records: 1701025 records

### London Wards
A census block is the smallest geography for which census data is reported. All higher level census geographies (block groups, tracts, metro areas, counties, etc) can be built from unions of census blocks. We have attached some demographic data to our collection of blocks.

| Field | Description |
| :---- | :--- |
| **name** |  |
| **gss_code** |  |
| **hectares** |  |
| **nonld_area** |  |
| **lb_gss_cd** |  |
| **borough** |  |
| **poly_id** |  |

Number of records: 

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

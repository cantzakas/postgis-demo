# About the data used on this demo
The data for this workshop is CSV and shapefiles for the area of Greater London, United Kingdom which are available via either [Ordnance Survey Open Data](http://www.os.uk/oswebsite/opendata/index.html) or [Transport for London (TfL) Open Data](https://tfl.gov.uk/info-for/open-data-users/)

The following paragraphs describe the table attributes for each of our datasets and number of records (as of May 2018).

## Ordnance Survey Open Data

### Code-Point® Open
Code-Point® Open gives you a precise geographic location for each postcode unit in Great Britain. Postcodes, also know as postal codes in the United Kingdom, are alphanumeric; the structure of a postcode is a one or two-letter postcode area code named after a local city, town or area of London, one or two digits signifying a district in that region, a space, and then an arbitrary code of one number and two letters. 

| Field | Description |
| :---- | :--- |
| **pc** | Postcode unit |
| **pq** | Postitional quality indicator |
| **ea** | Eastings |
| **no** | Northings |
| **cy** | Country code |
| **rh** | NHS regional health authority  code |
| **lh** | NHS health authority  code |
| **cc** | Administrative county code |
| **dc** | Administrative district code |
| **wc** | Administrative ward code |

| File metadata | |
| :---- | :--- |
| Resolution | 1-m accuracy for the central position of the postcode unit |
| Coordinates | National Grid |
| Coverage | Great Britain (England, Scotland, Wales) |
| Data type | Point Data |
| Supply formats | CSV |
| Update cycle | Quarterly, in February, May, August and November |
| Number of records (May 2018) | 1701025 |

Code-Point® Open also provides the reference information:
- [Area codes](cpo-area-codes.md)
- [County codes](cpo-county-codes.md)
- [District codes](cpo-district-codes.md)
- [District Ward codes](cpo-district-ward-codes.md)
- [London Borough codes](cpo-lon-borough-codes.md)
- [London Borough Ward codes](cpo-lon-borough-ward-codes.md)
- [Metropolitan District codes](cpo-met-district-codes.md)
- [Metropolitan District Ward codes](cpo-met-district-ward-codes.md)
- [Unitary Authority codes](cpo-uni-auth-codes.md)
- [Unitary Authority Electoral Division codes](cpo-uni-auth-electoral-codes.md)
- [Unitary Authority Ward codes](cpo-uni-auth-ward-codes.md)
- [NHS codes](nhs-codes.md)

### OS Open Greenspace
OS Open Greenspace depicts the location and extent of spaces such as parks and sports facilities that are likely to be accessible to the public. Where appropriate, it also includes access points to show how people get into these sites. Its primary purpose is to enable members of the public to find and access green spaces near them for exercise and recreation.

The key features of Greenspace Open are:
- Comprehensive coverage of publicly accessible green spaces
- Polygons of the greenspace extents
- Access points to depict place and type of access to the site
- Four attributes for site name to allow multiple official and/or local names to be available in the product
- Freely available online as an Open Data download and as a layer in the OS Maps consumer web service

Open Greenspace comprises two feature types, while each feature type has associated attribution:
- GreenspaceSite; A polygon defining the extent of green spaces such as parks and sports facilities that are likely to be open
for use by members of the public. These extents are generalised.
- AccessPoint; A point feature denoting where access to a site is located, and what kind of access is permitted at that
location.

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

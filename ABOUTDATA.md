# About the data used on this demo
The data for this workshop is CSV and shapefiles for the area of Greater London, United Kingdom which are available via either [Ordnance Survey Open Data](http://www.os.uk/oswebsite/opendata/index.html) or [Transport for London (TfL) Open Data](https://tfl.gov.uk/info-for/open-data-users/)

The following paragraphs describe the table attributes for each of our datasets and number of records (as of May 2018).

## Ordnance Survey Open Data

### Code-Point® Open

#### Background
Code-Point® Open gives you a precise geographic location for each postcode unit in Great Britain. Postcodes, also know as postal codes in the United Kingdom, are alphanumeric; the structure of a postcode is a one or two-letter postcode area code named after a local city, town or area of London, one or two digits signifying a district in that region, a space, and then an arbitrary code of one number and two letters. 

#### Fields
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

#### File metadata
| | |
| :---- | :--- |
| Resolution | 1-m accuracy for the central position of the postcode unit |
| Coordinates | National Grid |
| Coverage | Great Britain (England, Scotland, Wales) |
| Data type | Point Data |
| Supply formats | CSV |
| Update cycle | Quarterly, in February, May, August and November |
| Number of records (May 2018) | 1701025 |

#### Additional Information
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

#### Background
OS Open Greenspace depicts the location and extent of spaces such as parks and sports facilities that are likely to be accessible to the public. Where appropriate, it also includes access points to show how people get into these sites. Its primary purpose is to enable members of the public to find and access green spaces near them for exercise and recreation.

The key features of Greenspace Open are:
- Comprehensive coverage of publicly accessible green spaces
- Polygons of the greenspace extents
- Access points to depict place and type of access to the site
- Four attributes for site name to allow multiple official and/or local names to be available in the product
- Freely available online as an Open Data download and as a layer in the OS Maps consumer web service

Open Greenspace comprises two feature types, while each feature type has associated attribution:
- ***GreenspaceSite***. A polygon defining the extent of green spaces such as parks and sports facilities that are likely to be open
for use by members of the public. These extents are generalised.
- ***AccessPoint***. A point feature denoting where access to a site is located, and what kind of access is permitted at that
location.

#### Fields
| Field | Description |
| :---- | :--- |
| **name** |  |
| **gss_code** |  |
| **hectares** |  |
| **nonld_area** |  |
| **lb_gss_cd** |  |
| **borough** |  |
| **poly_id** |  |

#### File metadata
| | |
| :---- | :--- |
| Resolution | 1-m accuracy for the central position of the postcode unit |
| Coordinates | National Grid |
| Coverage | Great Britain (England, Scotland, Wales) |
| Data type | Point Data |
| Supply formats | CSV |
| Update cycle | Quarterly, in February, May, August and November |
| Number of records (May 2018) | 1701025 |

#### Additional Information
https://www.ordnancesurvey.co.uk/docs/product-guides/os-open-greenspace-product-guide.pdf
https://www.ordnancesurvey.co.uk/docs/user-guides/os-open-greenspace-getting-started-guide.pdf

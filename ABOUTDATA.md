# About the data used on this demo
The data for this workshop is CSV and shapefiles for the area of Greater London, United Kingdom which are available via either [Ordnance Survey Open Data](http://www.os.uk/oswebsite/opendata/index.html) or [Transport for London (TfL) Open Data](https://tfl.gov.uk/info-for/open-data-users/)

The following paragraphs describe the table attributes for each of our datasets and number of records (as of May 2018).

## Ordnance Survey Open Data

### Code-Point® Open

#### Background
Code-Point® Open gives you a precise geographic location for each postcode unit in Great Britain. Postcodes, also know as postal codes in the United Kingdom, are alphanumeric; the structure of a postcode is a one or two-letter postcode area code named after a local city, town or area of London, one or two digits signifying a district in that region, a space, and then an arbitrary code of one number and two letters. 

#### Field attributes
| Field | Description |
| :---- | :--- |
| pc | Postcode unit |
| pq | Postitional quality indicator |
| ea | Eastings |
| no | Northings |
| cy | Country code |
| rh | NHS regional health authority  code |
| lh | NHS health authority  code |
| cc | Administrative county code |
| dc | Administrative district code |
| wc | Administrative ward code |

#### File metadata
| Metadata | Value |
| :------- | :---- |
| Resolution | 1-m accuracy for the central position of the postcode unit |
| Coordinates |  British National Grid (BNG) |
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

#### Field attributes
OS Open Greenspace comprises two feature types, while each feature type has associated attribution:
- GreenspaceSite; a polygon defining the extent of green spaces such as parks and sports facilities that are likely to be open
for use by members of the public. These extents are generalised.
- AccessPoint; a point feature denoting where access to a site is located, and what kind of access is permitted at that
location.

| Feature Type | Field | Description |
| :----------- | :---- | :---------- |
| Greenspace Sites | ID | The unique identifier of the site. The ID is generated each release and will change between versions of the product. |
| Greenspace Sites | Function | The function of the greenspace site. Functions are determined from a specific greenspace list, and only those sites which fall within this list have been included in this product. |
| Greenspace Sites | Distinctive Name | The name of the site. There is space within the product for up to four Distinctive Name attributes to be populated, if a site is known locally by more than one name. |
| Access Points | ID | The unique identifier of the access point |
| Access Points | Access Type | The type of access whcih is permitted at the particular point. |
| Access Points | Reference to Greenspace Site | The unique identifier of the Greenspace site to which the access point relates. | 

**Distinctive Name attribution** 

Where a site is known locally by more than one name, the product has been formatted to allow this to be populated in successive name attr butes. For many greenspaces, this will rely on information from local experts, who have been encouraged to populate the information to Ord ance Survey where relevant. These names are expected to be useful in gathering more information about a site, such as its opening times or  wnership information. Names will be populated in the product where they can be sourced from relevant existing data holdings during produc  creation. As a result, a limited number of records will contain distinctive name attribution in the first release. The population of this attribute will improve over time.

**Nested Sites**

Where more than one function can be identified within a greenspace, nesting is used. This means that where sites overlap, or where a whole site is contained within a larger site, they are published as separate polygons that overlap one another. For example, in the picture below the whole park is captured as one site, including the play areas. The play areas also have their own greenspace site captured separately and these sites overlap the park. Where nested sites are of the same function attribute, these sites will not be shown as separate but will be merged into a single site, to avoid duplicating the greenspace function on these sites.

#### File metadata
| Metadata | Value |
| :--- | :--- |
| Coordinates | British National Grid (BNG) |
| Coverage | Great Britain (England, Scotland, Wales) |
| Data structure | Polygons and points |
| Supply formats | GML, Esri Shape file |
| Update cycle | every 6 months |
| Number of records (April 2018) | GreenspaceSite 140763, AccessPoint 263853 |

#### Additional Information
- [Release notes version 1.0, April 2018](https://www.ordnancesurvey.co.uk/docs/release-notes/os-open-greenspace-release-note-apr-2018.pdf)
- [OS Open Greenspace Getting Started Guide](https://www.ordnancesurvey.co.uk/docs/user-guides/os-open-greenspace-getting-started-guide.pdf)
- [OS Open Greenspace Product Guide](https://www.ordnancesurvey.co.uk/docs/product-guides/os-open-greenspace-product-guide.pdf)
- [OS Open Greenspace Technical Specification](https://www.ordnancesurvey.co.uk/docs/technical-specifications/os-open-greenspace-technical-specification.pdf)
- [Ordnance Survey stylesheets for Greenspace premium and open products](https://github.com/OrdnanceSurvey/OS-Open-Greenspace-stylesheets)

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

***Note***: Eastings are referenced from the central meridian of each zone, & northings from the equator, both in metres. To avoid negative numbers, ‘false eastings’ and ‘false northings’ are used:
- Eastings are measured from 500,000 metres west of the central meridian. Eastings (at the equator) range from 166,021m to 833,978m (the range decreases moving away from the equator); a point on the the central meridian has the value 500,000m.
- In the northern hemisphere, northings are measured from the equator – ranging from 0 at the equator to 9,329,005m at 84°N). In the southern hemisphere they are measured from 10,000,000 metres south of the equator (close to the pole) – ranging from 1,116,915m at 80°S to 10,000,000m at the equator.

Number of records: 120 files, one file for each one or two-letter postcode area codes, a total of 1701025 records, as following:

| Postcode Area Code | # of records |
| -----------------: | -----------: |
| AB | 16951 |
| AL | 7724 |
| B | 41598 |
| BA | 15004 |
| BB | 13127 |
| BD | 16974 |
| BH | 15167 |
| BL | 10317 |
| BN | 22041 |
| BR | 6882 |
| BS | 26647 |
| CA | 12531 |
| CB | 10345 |
| CF | 23237 |
| CH | 18720 |
| CM | 17666 |
| CO | 13034 |
| CR | 8008 |
| CT | 14752 |
| CV | 20019 |
| CW | 9370 |
| DA | 8981 |
| DD | 8915 |
| DE | 16969 |
| DG | 6817 |
| DH | 8931 |
| DL | 13225 |
| DN | 21528 |
| DT | 7773 |
| DY | 10983 |
| E | 16353 |
| EC | 3890 |
| EH | 24243 |
| EN | 8546 |
| EX | 22109 |
| FK | 7693 |
| FY | 7257 |
| G | 31610 |
| GL | 20825 |
| GU | 22029 |
| HA | 10294 |
| HD | 7097 |
| HG | 4395 |
| HP | 13853 |
| HR | 6323 |
| HS | 962 |
| HU | 10874 |
| HX | 5654 |
| IG | 5924 |
| IP | 20871 |
| IV | 7254 |
| KA | 11584 |
| KT | 14272 |
| KW | 1828 |
| KY | 10026 |
| L | 20467 |
| LA | 11782 |
| LD | 2209 |
| LE | 22149 |
| LL | 20107 |
| LN | 9079 |
| LS | 21503 |
| LU | 6206 |
| M | 31613 |
| ME | 16188 |
| MK | 15214 |
| ML | 9589 |
| N | 17586 |
| NE | 33048 |
| NG | 28669 |
| NN | 16213 |
| NP | 13633 |
| NR | 23235 |
| NW | 14214 |
| OL | 13028 |
| OX | 19413 |
| PA | 9288 |
| PE | 26192 |
| PH | 6047 |
| PL | 17374 |
| PO | 23975 |
| PR | 12915 |
| RG | 22939 |
| RH | 15943 |
| RM | 9833 |
| S | 33298 |
| SA | 23134 |
| SE | 20559 |
| SG | 11766 |
| SK | 16368 |
| SL | 10732 |
| SM | 4362 |
| SN | 14334 |
| SO | 18210 |
| SP | 8489 |
| SR | 6550 |
| SS | 11817 |
| ST | 17531 |
| SW | 20422 |
| SY | 14310 |
| TA | 11587 |
| TD | 4458 |
| TF | 6888 |
| TN | 22526 |
| TQ | 9930 |
| TR | 11910 |
| TS | 17341 |
| TW | 11144 |
| UB | 7098 |
| W | 19108 |
| WA | 18069 |
| WC | 2729 |
| WD | 7319 |
| WF | 14278 |
| WN | 7088 |
| WR | 8586 |
| WS | 9992 |
| WV | 10435 |
| YO | 18357 |
| ZE | 647 |

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

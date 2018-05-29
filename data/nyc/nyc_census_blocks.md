## nyc\_census\_blocks

### Background
A census block is the smallest geography for which census data is reported. All higher level census geographies (block groups, tracts, metro areas, counties, etc) can be built from unions of census blocks. We have attached some demographic data to our collection of blocks.

### Field attributes
| Field | Description |
| :-------- | :---------- |
| blkid     | A 15-digit code that uniquely identifies every census block. Eg: 360050001009000 |
| popn_total | Total number of people in the census block |
| popn_white | Number of people self-identifying as “White” in the block |
| popn_black | Number of people self-identifying as “Black” in the block |
| popn_nativ | Number of people self-identifying as “Native American” in the block |
| popn_asian | Number of people self-identifying as “Asian” in the block |
| popn_other | Number of people self-identifying with other categories in the block |
| boroname | Name of the New York borough. Manhattan, The Bronx, Brooklyn, Staten Island, Queens |
| geom | Polygon boundary of the block |

### File metadata
| Metadata | Value |
| :------- | :---- |
| Number of records | 36592 |

![Black population as a percentage of Total Population](http://workshops.boundlessgeo.com/postgis-intro/_images/nyc_census_blocks.png)

`
Black population as a percentage of Total Population
`
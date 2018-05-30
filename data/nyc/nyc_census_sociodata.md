## nyc\_census\_sociodata

### Background
There is a rich collection of social-economic data collected during the census process, but only at the larger geography level of census tract. Census blocks combine to form census tracts (and block groups). We have collected some social-economic at a census tract level to answer some of these more interesting questions about New York City.

***Note***

The nyc\_census\_sociodata is a data table. We will need to connect it to Census geographies before conducting any spatial analysis.

### Field attributes
| Field | Description |
| :-------- | :---------- |
| tractid | An 11-digit code that uniquely identifies every census tract. (“36005000100”) |
| transit_total | Number of workers in the tract |
| transit_private | Number of workers in the tract who use private automobiles / motorcycles |
| transit_public | Number of workers in the tract who take public transit |
| transit_walk | Number of workers in the tract who walk |
| transit_other | Number of workers in the tract who use other forms like walking / biking |
| transit_none | Number of workers in the tract who work from home |
| transit\_time\_mins | Total number of minutes spent in transit by all workers in the tract (minutes) |
| family_count | Number of families in the tract |
| family\_income\_median | Median family income in the tract (dollars) |
| family\_income\_mean | Average family income in the tract (dollars) |
| family\_income\_aggregate | Total income of all families in the tract (dollars) |
| edu_total | Number of people with educational history |
| edu\_no\_highschool\_dipl | Number of people with no high school diploma |
| edu\_highschool\_dipl | Number of people with high school diploma and no further education |
| edu\_college\_dipl | Number of people with college diploma and no further education |
| edu\_graduate\_dipl | Number of people with graduate school diploma |

### File metadata
| Metadata | Value |
| :------- | :---- |
| Number of records | |

### Additional Information

| Previous: | Up: |
| :-------- | :---- |
| [nyc_streets](/data/nyc/nyc_streets.md) | [About the data used on this demo](/ABOUTDATA.md) |

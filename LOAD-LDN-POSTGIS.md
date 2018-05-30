# Load Ordnance Survey Open Data
## Code-Point® Open
Code-Point® Open data arrive in different formats:
- Postcode information arrive in CSV files, one for east one- or two-letter postcode area codes, a total of 120 CSV files. To load these into Greenplum will create an `EXTERNAL TABLE`, pointing to the local folder where the CSV files are located, as following:

```sql
DROP EXTERNAL TABLE IF EXISTS LDN_CODE_POINT_OPEN;
CREATE EXTERNAL TABLE LDN_CODE_POINT_OPEN (
	pc_ TEXT, 
	pq_ TEXT,  
	ea_ TEXT, 
	no_ TEXT, 
	cy_ TEXT, 
	rh_ TEXT, 
	lh_ TEXT, 
	cc_ TEXT, 
	dc_ TEXT, 
	wc_ TEXT) 
LOCATION ('file://seghost[:port]/path/file' [, ...])
FORMAT 'CSV' (DELIMITER AS ',' QUOTE AS '"');
``` 
To confirm the correct number of files and entries have been loaded, one can run the following script:
```sql
SELECT postcode_2[1] AS postcode_file, COUNT(*) AS postcode_file_entry_count
FROM (SELECT regexp_matches(pc_, '([A-Za-z]{1,2})(?:\d+.*)') AS POSTCODE_2 FROM LDN_CODE_POINT_OPEN) A
GROUP BY 1
ORDER BY 1 ASC;
```
| postcode\_file | postcode\_file\_entry\_count |
| :------------- | :--------------------------- |
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
| ... | |

- Related reference information, i.e. , area, county, district codes, etc. arrive along with Code-Point® Open data, originaly in a .xlsx (Microsoft Excel) file. For ease of loading, the appropriate scripts are available [here]().
## Boundary-Line™
## OS Open Greenspace
## OS Open Names
## OS Open Roads
## OS Open Rivers
# TfL's free Transport Data

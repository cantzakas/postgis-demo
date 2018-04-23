# Simple SQL Exercices
SQL, or “Structured Query Language”, is a means of asking questions of, and updating data in, relational databases. Here area some examples
- **"Which version of Greenplum Database software, am I running on the cluster?"**
```sql
SELECT version();
```
Alternatively, the *psql* command utility can be used for the same, as following:
```sql
psql -d <database-name> -c "SELECT version();"
```

In both cases, the query result would be similar to

| version |
| :---    |
| PostgreSQL 8.3.23 (Greenplum Database 5.7.0 build commit:f7c6eb5cc61b25a7ff9c5a657d6f903befbae013) on x86_64-pc-linux-gnu, compiled by GCC gcc (GCC) 6.2.0, 64-bit compiled on Mar 30 2018 14:19:06 |
| (1 row) |

- **"Which version of PostGIS extension, am I running on the Greenplum Database cluster?"**
```sql
SELECT postgis_full_version();
```

| version |
| :---    |
| POSTGIS="2.1.5 r13152" GEOS="3.4.2-CAPI-1.8.2 r3921" PROJ="Rel. 4.8.0, 6 March 2012" GDAL="GDAL 1.11.1, released 2014/09/24" LIBXML="2.7.6" LIBJSON="UNKNOWN" RASTER |
| (1 row) |

- **“What is the population of the City of New York?”**
```sql
SELECT
  SUM(popn_total) AS population 
FROM
  nyc_census_blocks;
```

| population |
| :---    |
| 8,175,032.00 |
| (1 row) |

- **“What is the population of the Bronx?”**
```sql
SELECT
  SUM(popn_total) AS population
FROM
  nyc_census_blocks
WHERE
  boroname = 'The Bronx';
```

| population |
| :---    |
| 1,385,108.00 |
| (1 row) |

- **“For each borough, what percentage of the population is white?”**
```sql
SELECT
  boroname,
  100 * Sum(popn_white)/Sum(popn_total) AS white_pct
FROM
  nyc_census_blocks
GROUP BY 
  boroname;
```
<table>
  <tr>
    <th>boroname</td>
    <th>white_pct</td>
  <tr>
    <td>Queens</td>
    <td>39.72207739459101</td>
  </tr>
  <tr>
    <td>Brooklyn</td>
    <td>42.80117379326865</td>
  </tr>
  <tr>
    <td>Manhattan</td>
    <td>57.44930394804628</td>
  </tr>
  <tr>
    <td>Staten Island</td>
    <td>72.8942034860154</td>
  </tr>
  <tr>
    <td>The Bronx</td>
    <td>27.903744689944755</td>
  </tr>
  <tr>
    <td colspan="2">5 rows</td>
  </tr>
</table>

# Loading the Demo Data into a Pivotal Greenplum Database

## Loading Data Using SQL
To load the demo dataset for this demo, we will use the _shp2pgsql_ utility, which was described on the previous [page](/HOWTO-LOAD-GIS-DATA.md)

The demo dataset contains GIS/Geospatial information for 5 different entities:
- nyc_census_blocks,
- nyc_neighborhoods,
- nyc_streets,
- nyc\_subway\_stations, and
- nyc_census_sociodata

For first 4 of the above, _nyc\_census\_blocks, nyc\_neighborhoods, nyc\_streets, nyc\_subway\_stations_, we will use the _shp2pgsql_ utility, to create a table in the Greenplum Database, prepare the ``INSERT`` statements which would load the data into this table and finally create an index on the geometry column of each table, as shown here:

```shell
shp2pgsql -c -D -s 26918 -i -I nyc_census_blocks.shp public.nyc_census_blocks > nyc_census_blocks.sql

shp2pgsql -c -D -s 26918 -i -I nyc_neighborhoods.shp public.nyc_neighborhoods > nyc_neighborhoods.sql

shp2pgsql -c -D -s 26918 -i -I nyc_streets.shp public.nyc_streets > nyc_streets.sql

shp2pgsql -c -D -s 26918 -i -I nyc_subway_stations.shp public.nyc_subway_stations > nyc_subway_stations.sql

```

Then using the _psql_ utility, we execute each of the above ``sql`` files against the database, as shown here:
```shell
psql -d nyc -U gpadmin -f nyc_census_blocks.sql

psql -d nyc -U gpadmin -f nyc_neighborhoods.sql

psql -d nyc -U gpadmin -f nyc_streets.sql

psql -d nyc -U gpadmin -f nyc_subway_stations.sql

```

***Note***

When using either ``-D`` (use the PostgreSQL "dump" format for the output data) or ``-I`` (create a GiST index on the geometry column) flag, ``shp2pgslq`` utility is instructed to create an index on the geometry column defined on the target database table by issuing SQL statements of the

```sql
CREATE INDEX ON "<schema_name>"."<table_name>" 
	USING GIST ("<column_name>");
``` 

format. Such SQL statements throw a syntac error when executed againsts a Greenplum Database which only supports creation of named indexes. To work-around this issue, it is suggested that manual edit the ``sql`` files produced and use a unique name for each index, i.e.

```sql
CREATE INDEX "<schema_name>"."<index_name>" ON "<schema_name>"."<table_name>" 
	USING GIST ("<column_name>");
```

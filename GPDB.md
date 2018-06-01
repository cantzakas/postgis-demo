# Welcome to Pivotal Greenplum Database

Pivotal Greenplum Database is a massively parallel processing (MPP) database server that supports next generation data warehousing and large-scale analytics processing. By automatically partitioning data and running parallel queries, it allows a cluster of servers to operate as a single database supercomputer performing tens or hundreds times faster than a traditional database. It supports SQL, MapReduce parallel processing, and data volumes ranging from hundreds of gigabytes, to hundreds of terabytes.

Pivotal Greenplum 5.x software is available for download from the Pivotal Greenplum page on [Pivotal Network](https://network.pivotal.io/products/pivotal-gpdb).

## Introduction to Greenplum

Greenplum Database stores and processes large amounts of data by distributing the load across several servers or hosts. A logical database in Greenplum is an array of individual PostgreSQL databases working together to present a single database image. The master is the entry point to the Greenplum Database system. It is the database instance to which users connect and submit SQL statements. The master coordinates the workload across the other database instances in the system, called segments, which handle data processing and storage. The segments communicate with each other and the master over the *interconnect*, the networking layer of Greenplum Database.

<img src='https://gpdb.docs.pivotal.io/570/install_guide/graphics/highlevel_arch.jpg' />

Greenplum Database is a software-only solution; the hardware and database software are not coupled. Greenplum Database runs on a variety of commodity server platforms from Greenplum-certified hardware vendors. Performance depends on the hardware on which it is installed. Because the database is distributed across multiple machines in a Greenplum Database system, proper selection and configuration of hardware is vital to achieving the best possible performance.

For high-level overview of the Greenplum Database system architecture and further information on the major components of a Greenplum Database system, hardware considerations and concepts associated with each component, please refer to the [Introduction to Greenplum](https://gpdb.docs.pivotal.io/570/install_guide/preinstall_concepts.html) document, available on online [Pivotal Greenplum Documentation](https://gpdb.docs.pivotal.io/).

| Previous: | Up: | Next: |
| :--- | :--- | :--- |
| [Instructions & Background Info](README.md#instructions--background-info) | [PostGIS Demo Start](README.md) | [Greenplum PostGIS Extension](POSTGIS.md) |
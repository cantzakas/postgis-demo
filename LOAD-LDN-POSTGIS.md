# Load Ordnance Survey Open Data
## Code-Point® Open
Code-Point® Open data arrive in different formats:
- Postcode information arrive in CSV files, one for east one- or two-letter postcode area codes.
- Reference information related to the postcode above, arrive in a .xlsx (Microsoft Excel) file. For ease of loading, the loading scripts for the reference information are available [here]().
## Boundary-Line™
## OS Open Greenspace
## OS Open Names
## OS Open Roads
## OS Open Rivers
# TfL's free Transport Data




hello all,

on your questions:

### > ​what are the criteria for assigning the level of effort to implement the changes (low/high)
by ***level of effort to implement changes*** we meant to describe the risk of change rather​ than ​quantifying the actual effort. 

Practically, we used low/medium/high to describe how risky a certain category of change(s) ​as following;
- low to describe a fairly straightforward and well described change request which can scheduled/scripted/changed on an existing UI, such as those which are requested i.e. on EXTERNAL table definition, or on MicroStrategy interface or ​changes that are handled downstream appropriately by tools generating the queries i.e. gpload on version 5.x prepares statements supported on GPDB 5.x,
- medium to describe a change which is well identified but may or may not be supported on an existing UI but we think can be worked around using a different approach/technique, and
- high to describe changes with significant risk associated, such as structural changes or not supported by a known UI.

Having said that, the majority of the changes we have identified should be implemented in your own custom/user scripts or in MicroStrategy, Pentaho and similar and not directly into Greenplum - we cannot certainly have an opinion on parameters such as the number of available resources and technical expertise on each of these software not Pivotal provides services on most of these, thus we have not in any case tried to strictly quantify those (i.e. x days on custom scripts, Y days on MicroStrategy, etc). You internally should be far better capable vs us, on putting a number next to each.

### > ​please send a detailed information related with the different types of errors by source plugin
our analysis of the 4.3.x database logs, identifies patterns in your queries before actually trying to “replay” those into a 5.x Greenplum - that said​​, since it is not currently supported by our analysis tool,​​ I have no clear information​ to share with you​​ for the volumes of queries as per the breakdown you have asked me for. What I can do, is​ ​discuss with​ the team who developed the tool​ and​ ask how easy and when (at what timeframe)​ they could ​provide us with a version of the tool which will support such a breakdown, and​ ​then​ I will get back to you.
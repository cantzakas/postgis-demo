## Ordnance Survey Open Data, Boundary-Line™

### Background
[Boundary-Line™](https://www.ordnancesurvey.co.uk/business-and-government/products/boundary-line.html) is a vector digital mapping product that is a complete set of local government administrative boundaries and electoral boundaries used in local and general election voting. It has been specifically designed to show the area of each administrative or electoral boundary.

Boundary-Line™ contains all the current (operative) administrative and electoral boundaries for Great Britain. The product contains the following boundaries:
- Civil parishes and communities.
- Counties, Districts, Wards, Metropolitan districts, Electoral divisions.
- Greater London Authorities and Assembly, London boroughs, Metropolitan districts, Unitary authorities.
- Westminster parliamentary constituencies, Scottish parliamentary constituency and Electoral region, Welsh Assembly constituency and Electoral region.
- European electoral region.
- Mean high water mark and Census agency codes.

### File metadata
| Metadata | Value |
| :------- | :---- |
| Scale    | Print: 1:10 000 scale recommended <br/> Screen: 1:5000 – 1:8000|
| Coordinates | National Grid |
| Coverage | Great Britain (England, Scotland and Wales) |
| Supply formats | ESRI® Shapefile |
| Scottish and Welsh names | Yes (where available) |
| Update cycle | Six monthly – May and October |

### File Structure and Attributes
Boundary-Line™ data arrive as a set of ESRI® Shapefiles. The Shapefile format defines the geometry and attributes of geographically-referenced features in as many as five files with specific file extensions that should be stored in the same project workspace. They are:
- .shp – the file that stores the feature geometry.
- .shx – the file that stores the index of the feature geometry.
- .dbf – the dBASE file that stores the attribute information of features. When a Shapefile is added as a theme to a view, this file is displayed as a feature table.
- .sbn and .sbx – the files that store the spatial index of the features. These two files will only exist if you perform theme-on-theme selection, spatial joins, or create an index on a theme's SHAPE field.
- .prj – the file that stores the projection information.

| <td colspan=4>Shapefile table structures</td> |||
| :--- | :--- | :--- | :--- |
| <td colspan=2>**Regions** | <td colspan=2>**Polylines** |
| **Title** | **Type** | Title | Type |
| FID*  | Object ID | FID* | Object ID |
| SHAPE* | Geometry | SHAPE* | Geometry |

NAME Text CODE Text
AREA_CODE Text DESCRIPTO Text
DESCRIPTO Text FILE_NAME Text
FILE_NAME Text NUMBER Double
NUMBER Double LINK_ID Double
NUMBER0 Double
POLYGON_ID Double
UNIT_ID Double
CODE Text
HECTARES Double
AREA Double
TYPE_CODE Text
DESCRIPT0 Text
TYPE_COD0 Text
DESCRIPT1 Text

### Additional Information
Additional information on Ordnance Survey Open Data, Boundary-Line™ can be found on the their [website](https://www.ordnancesurvey.co.uk/business-and-government/products/boundary-line.html).

Ordnance Survey Open Data, Boundary-Line™ also provides the reference information:
- [OS OpenData getting started guide](https://www.ordnancesurvey.co.uk/docs/user-guides/os-opendata-getting-started-guides.pdf)
- [Ordnance Survey Open Data, Boundary-Line™ Product Guide and Technical Specification](https://www.ordnancesurvey.co.uk/docs/user-guides/boundary-line-user-guide.pdf)

| Previous: | Up: | Next: |
| :-------- | :-- | :---- |
| [Ordnance Survey Open Data, Code-Point® Open](cpo.md) | [About the data used on this demo](../../ABOUTDATA.md) | [Ordnance Survey Open Data, OS Opean Names](oso-names.md) |

/* 
 * 1. Create and load data into L_CP_AREA_CODES
 */

DROP EXTERNAL TABLE IF EXISTS L_CP_AREA_CODES;
CREATE EXTERNAL TABLE L_CP_AREA_CODES (
	CODE_POINT_AREA_CODE_TYPE TEXT NOT NULL,
	CODE_POINT_AREA_CODE_DESC TEXT NOT NULL
) DISTRIBUTED RANDOMNLY;

INSERT INTO L_CP_AREA_CODES (CODE_POINT_AREA_CODE_TYPE, CODE_POINT_AREA_CODE_DESC) VALUES 
('CTY', 'County'), 
('DIS', 'District'),
('DIW', 'District Ward'),
('LBO', 'London Borough'),
('LBW', 'London Borough Ward'),
('MTD', 'Metropolitan District'),
('MTW', 'Metropolitan District Ward'),
('UTA', 'Unitary Authority'),
('UTE', 'Unitary Authority Electoral Division'),
('UTW', 'Unitary Authority Ward');

/* 
 * 2. Create and load data into L_CP_COUNTY_CODES
 */

DROP EXTERNAL TABLE IF EXISTS L_CP_COUNTY_CODES;
CREATE EXTERNAL TABLE L_CP_COUNTY_CODES (
	CODE_POINT_COUNTY_CODE_ID TEXT NOT NULL,
	CODE_POINT_COUNTY_CODE_DESC TEXT NOT NULL
) DISTRIBUTED RANDOMNLY;

INSERT INTO L_CP_COUNTY_CODES (CODE_POINT_COUNTY_CODE_DESC, CODE_POINT_COUNTY_CODE_ID) VALUES 
('Buckinghamshire County', 'E10000002'),
('Cambridgeshire County', 'E10000003'),
('Cumbria County', 'E10000006'),
('Derbyshire County', 'E10000007'),
('Devon County', 'E10000008'),
('Dorset County', 'E10000009'),
('East Sussex County', 'E10000011'),
('Essex County', 'E10000012'),
('Gloucestershire County', 'E10000013'),
('Hampshire County', 'E10000014'),
('Hertfordshire County', 'E10000015'),
('Kent County', 'E10000016'),
('Lancashire County', 'E10000017'),
('Leicestershire County', 'E10000018'),
('Lincolnshire County', 'E10000019'),
('Norfolk County', 'E10000020'),
('Northamptonshire County', 'E10000021'),
('North Yorkshire County', 'E10000023'),
('Nottinghamshire County', 'E10000024'),
('Oxfordshire County', 'E10000025'),
('Somerset County', 'E10000027'),
('Staffordshire County', 'E10000028'),
('Suffolk County', 'E10000029'),
('Surrey County', 'E10000030'),
('Warwickshire County', 'E10000031'),
('West Sussex County', 'E10000032'),
('Worcestershire County', 'E10000034');
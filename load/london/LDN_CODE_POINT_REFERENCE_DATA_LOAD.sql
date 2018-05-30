DROP EXTERNAL TABLE IF EXISTS R_LDN_CODE_POINT_AREA_CODES;
CREATE EXTERNAL TABLE R_LDN_CODE_POINT_AREA_CODES (
	CODE_POINT_AREA_CODE_TYPE TEXT NOT NULL,
	CODE_POINT_AREA_CODE_DESC TEXT NOT NULL
) DISTRIBUTED RANDOMNLY;

INSERT INTO R_LDN_CODE_POINT_AREA_CODES (CODE_POINT_AREA_CODE_TYPE, CODE_POINT_AREA_CODE_DESC) VALUES 
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
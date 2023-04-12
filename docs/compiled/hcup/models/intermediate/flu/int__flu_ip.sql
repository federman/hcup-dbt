
with 

staged as (
  select 
    *,
    
    
    
        I10_DX1 IN ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9') OR 
        I10_DX2 IN ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9')
     AS flu,
    
    
    
        I10_DX1 IN ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471') OR 
        I10_DX2 IN ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471')
     AS flu_like, 
  from "main"."parquet"."int__sid_core"
),

final as (
  select 
  *,
  CASE
    WHEN (flu AND flu_like) THEN 'BOTH'
    WHEN (flu AND NOT(flu_like)) THEN 'ILI'
    WHEN (NOT(flu) AND flu_like) THEN 'ILI LIKE'
    ELSE 'OTHER'
    END AS ili_diagnosis_var  
  from staged
)

select * from final
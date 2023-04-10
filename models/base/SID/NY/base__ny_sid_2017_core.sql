{{ config(materialized='external', format =  target.schema) }}
SELECT
  "KEY",
 "AGE", "AYEAR", "AMONTH", "ZIP", "ZIP3", "VisitLink", 
    "CPT1", "CPT2", "CPT3", "CPTCCS1","CPTCCS2", 
    "DHOUR", "DMONTH", "DQTR", "DRG", "DISP_X", "DISPUB04", "DMONTH", "DQTR", "DSHOSPID", 
    "HCUP_ED","HCUP_OS", "HOSPST",  
    "I10_DX1","I10_DX2", 
    "LOS", "PSTCO", "PSTCO2","HISPANIC", "RACE", "ZIPINC_QRTL", "PAY1", "DIED", "FEMALE", "HOSP_NPI", 
    "I10_DX_Admitting" ,
  'sid_core' AS db_file,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
FROM {{ source('SID', 'NY_SID_2017_CORE') }}

{{ limit_data_in_dev() }}
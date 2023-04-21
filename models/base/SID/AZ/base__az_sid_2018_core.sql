{{ config(materialized='external', format =  target.schema) }}
SELECT
  AGE,
  AMONTH,
  AYEAR,
  NULL AS CPT1,
  NULL AS CPT2,
  NULL AS CPT3,
  NULL AS CPTCCS1,
  NULL AS CPTCCS2,
  DHOUR,
  DIED,
  DISP_X,
  DISPUB04,
  DMONTH,
  DQTR,
  DRG,
  DSHOSPID,
  FEMALE,
  HCUP_ED,
  HCUP_OS,
  HISPANIC,
  HOSP_NPI,
  HOSPST,
  I10_DX_Admitting,
  I10_DX1,
  I10_DX2,
  KEY,
  LOS,
  PAY1,
  NULL AS PSTCO,
  PSTCO2,
  RACE,
  NULL AS VisitLink,
  ZIP,
  ZIP3,
  ZIPINC_QRTL,
  'AZ' AS state,
FROM {{ source('SID', 'AZ_SID_2018_CORE') }}

{{ limit_data_in_dev() }}




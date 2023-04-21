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
  PSTCO,
  PSTCO2,
  RACE,
  VisitLink,
  ZIP,
  ZIP3,
  ZIPINC_QRTL,
  'NY' AS state,
FROM {{ source('SID', 'NY_SID_2018_CORE') }}

{{ limit_data_in_dev() }}




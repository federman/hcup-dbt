{{ config(materialized='external', format =  target.schema) }}
SELECT
  AGE,
  AMONTH,
  AYEAR,
  CPT1,
  CPT2,
  CPT3,
  CPTCCS1,
  CPTCCS2,
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
  NULL AS HOSP_NPI,
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
  NULL AS VisitLink,
  ZIP,
  ZIP3,
  ZIPINC_QRTL,
  'NJ' AS state,
FROM {{ source('SID', 'NJ_SID_2017_CORE') }}

{{ limit_data_in_dev() }}




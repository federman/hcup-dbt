{{ config(materialized='external', format =  target.schema) }}
SELECT
  AGE,
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
  DSHOSPID,
  FEMALE,
  HCUP_ED,
  HCUP_OS,
  HISPANIC,
  HOSP_NPI,
  HOSPST,
  I10_DX_Visit_Reason1,
  I10_DX_Visit_Reason2,
  I10_DX1,
  I10_DX2,
  KEY,
  LOS,
  PAY1,
  PSTCO,
  PSTCO2,
  RACE,
  VisitLink,
  YEAR,
  ZIP,
  ZIP3,
  ZIPINC_QRTL,
  'SEDD' AS db,
  'CORE' AS file,
FROM {{ source('SEDD', 'NY_SEDD_2018_CORE') }}

{{ limit_data_in_dev() }}

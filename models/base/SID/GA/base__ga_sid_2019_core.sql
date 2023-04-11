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
  DIED,
  DISP_X,
  DISPUB04,
  DMONTH,
  DQTR,
  DRG,
  FEMALE,
  HCUP_ED,
  HCUP_OS,
  HISPANIC,
  HOSPST,
  I10_DX1,
  I10_DX2,
  LOS,
  PAY1,
  PSTCO,
  RACE,
  VisitLink,
  ZIP,
  ZIP3,
  ZIPINC_QRTL,
  'sid_core' AS db_file,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
FROM {{ source('SID', 'GA_SID_2019_CORE') }}

{{ limit_data_in_dev() }}

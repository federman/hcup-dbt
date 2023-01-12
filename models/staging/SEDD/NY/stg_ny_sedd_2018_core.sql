{{ config(materialized='external', format =  target.schema) }}
SELECT
  "KEY",
  AGE,
  DIED,
  RACE,
  HISPANIC,
  FEMALE,
  PAY1,
  ZIP,
  AYEAR,
  AMONTH,
  I10_DX_Visit_Reason1,
  I10_DX_Visit_Reason2,
  I10_DX1,
  I10_DX2,
  'sedd_core' AS db_file,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
FROM {{ source('SEDD', 'NY_SEDD_2018_CORE') }}

{{ limit_data_in_dev() }}
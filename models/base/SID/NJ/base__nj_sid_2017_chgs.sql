{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  REVCODE,
  UNITS,
  'sid_core' AS db_file,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
FROM {{ source('SID', 'NJ_SID_2017_CHGS') }}

{{ limit_data_in_dev() }}

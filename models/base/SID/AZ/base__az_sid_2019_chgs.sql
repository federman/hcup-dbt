{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  'sid_core' AS db_file,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
FROM {{ source('SID', 'AZ_SID_2019_CHGS') }}

{{ limit_data_in_dev() }}

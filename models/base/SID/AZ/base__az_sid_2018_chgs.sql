{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  NULL AS REVCODE,
  NULL AS UNITS,
  'SID' AS db,
  'CHGS' AS file,
FROM {{ source('SID', 'AZ_SID_2018_CHGS') }}

{{ limit_data_in_dev() }}

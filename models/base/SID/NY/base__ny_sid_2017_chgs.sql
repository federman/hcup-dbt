{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  REVCODE,
  UNITS,
  'SID' AS db,
  'CHGS' AS file,
FROM {{ source('SID', 'NY_SID_2017_CHGS') }}

{{ limit_data_in_dev() }}

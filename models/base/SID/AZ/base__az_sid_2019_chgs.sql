{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  'SID' AS db,
  'CHGS' AS file,
FROM {{ source('SID', 'AZ_SID_2019_CHGS') }}

{{ limit_data_in_dev() }}

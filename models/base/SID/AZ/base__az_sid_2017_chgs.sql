{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  'SID' AS db,
  'CHGS' AS file,
  'AZ' AS state,
  '2017' AS year,
FROM {{ source('SID', 'AZ_SID_2017_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__az_sid_2017_core') }}


GROUP BY KEY

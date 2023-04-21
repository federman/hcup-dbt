{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  'SID' AS db,
  'CHGS' AS file,
  'AZ' AS state,
  '2019' AS year,
FROM {{ source('SID', 'AZ_SID_2019_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__az_sid_2019_core') }}


GROUP BY KEY

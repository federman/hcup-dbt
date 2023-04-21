{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  'SID' AS db,
  'CHGS' AS file,
  'NY' AS state,
  '2017' AS year,
FROM {{ source('SID', 'NY_SID_2017_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__ny_sid_2017_core') }}


GROUP BY KEY

{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  'SID' AS db,
  'CHGS' AS file,
  'NJ' AS state,
  '2017' AS year,
FROM {{ source('SID', 'NJ_SID_2017_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__nj_sid_2017_core') }}


GROUP BY KEY

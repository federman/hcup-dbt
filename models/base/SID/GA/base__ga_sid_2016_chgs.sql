{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  'SID' AS db,
  'CHGS' AS file,
  'GA' AS state,
  '2016' AS year,
FROM {{ source('SID', 'GA_SID_2016_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__ga_sid_2016_core') }}


GROUP BY KEY

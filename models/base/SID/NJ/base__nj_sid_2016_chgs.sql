{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  
FROM {{ source('SID', 'NJ_SID_2016_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__nj_sid_2016_core') }}


GROUP BY KEY

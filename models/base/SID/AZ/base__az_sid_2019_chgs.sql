{{ config(materialized='external', format =  target.schema) }}
SELECT
  KEY,
  SUM(CHARGE) AS total_charge,
  
FROM {{ source('SID', 'AZ_SID_2019_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__az_sid_2019_core') }}


GROUP BY KEY

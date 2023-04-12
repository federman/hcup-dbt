{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  REVCODE,
  UNITS,
  'SID' AS db,
  'CHGS' AS file,
FROM {{ source('SID', 'NJ_SID_2017_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__nj_sid_2017_core') }}

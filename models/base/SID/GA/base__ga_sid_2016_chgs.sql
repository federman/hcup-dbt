{{ config(materialized='external', format =  target.schema) }}
SELECT
  CHARGE,
  KEY,
  REVCODE,
  UNITS,
  'SID' AS db,
  'CHGS' AS file,
FROM {{ source('SID', 'GA_SID_2016_CHGS') }}

{{ limit_chgs_in_dev(core_model = 'base__ga_sid_2016_core') }}

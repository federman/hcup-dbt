{% if target.name == 'stage' %}
  {% set format_tmp = 'csv'%}
{% else %}      
  {% set format_tmp = 'parquet'%}
{% endif %}

{{ config(materialized='external', format = format_tmp) }}
SELECT
  "KEY",
  AGE,
  DIED,
  RACE,
  HISPANIC,
  FEMALE,
  PAY1,
  ZIP,
  AYEAR,
  AMONTH,
  CONCAT_WS('', AYEAR, '-', AMONTH, '-01') AS admit_date,
  I10_DX_Visit_Reason1,
  I10_DX_Visit_Reason2,
  I10_DX1,
  I10_DX2,
FROM {{ source('SEDD', 'NY_SEDD_2018_CORE') }}

{{ limit_data_in_dev() }}
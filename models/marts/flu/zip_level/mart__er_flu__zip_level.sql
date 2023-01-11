{% if target.name == 'stage' %}
  {% set format_tmp = 'csv'%}
{% else %}      
  {% set format_tmp = 'parquet'%}
{% endif %}

{{ config(materialized='external', format = format_tmp) }}

SELECT
  AGE,
  RACE,
  HISPANIC,
  ZIP,
  FEMALE,
  flu,
  flu_like,
  ili_diagnosis_var,
  COUNT(*) AS n
FROM {{ref('mart__er_flu__line_level')}}
GROUP BY AGE, RACE, HISPANIC, ZIP, FEMALE, flu, flu_like, ili_diagnosis_var



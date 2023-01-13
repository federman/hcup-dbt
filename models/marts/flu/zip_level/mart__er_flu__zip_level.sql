{{ config(materialized='external', format =  target.schema) }}
SELECT
  AGE,
  RACE,
  HISPANIC,
  ZIP,
  FEMALE,
  flu,
  flu_like,
  ili_diagnosis_var,
  COUNT(*) AS count
FROM {{ref('mart__er_flu__line_level')}}
GROUP BY AGE, RACE, HISPANIC, ZIP, FEMALE, flu, flu_like, ili_diagnosis_var



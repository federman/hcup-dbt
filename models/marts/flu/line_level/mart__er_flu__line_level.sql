{{ config(materialized='external', format =  target.schema) }}
select 
"KEY",
  AGE,
  DIED,
  RACE,
  HISPANIC,
  FEMALE,
  ZIP,
  flu,
  flu_like,
  ili_diagnosis_var
FROM {{ref('int_sedd_flu_line_level')}}


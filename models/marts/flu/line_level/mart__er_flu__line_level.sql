{{ config(materialized='external', format =  target.schema) }}
select 
"KEY",
  AGE,
  DIED,
  RACE,
  HISPANIC,
  FEMALE,
  admit_date,
  ZIP,
  flu,
  flu_like,
  CASE
    WHEN (flu AND flu_like) THEN 'BOTH'
    WHEN (flu AND NOT(flu_like)) THEN 'ILI'
    WHEN (NOT(flu) AND flu_like) THEN 'ILI LIKE'
    ELSE 'OTHER'
    END AS ili_diagnosis_var
FROM {{ref('int_sedd_flu_line_level')}}


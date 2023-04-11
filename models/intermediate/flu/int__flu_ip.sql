{{ config(materialized='external', format =  target.schema) }}
with 

staged as (
  select 
    *,
    {{dx_flag_flu(db="SID")}} AS flu,
    {{dx_flag_flu_like(db="SID")}} AS flu_like, 
  from {{ref('int__sid_core')}}
),

final as (
  select 
  *,
  CASE
    WHEN (flu AND flu_like) THEN 'BOTH'
    WHEN (flu AND NOT(flu_like)) THEN 'ILI'
    WHEN (NOT(flu) AND flu_like) THEN 'ILI LIKE'
    ELSE 'OTHER'
    END AS ili_diagnosis_var  
  from staged
)

select * from final


{{ config(materialized='external', format =  target.schema) }}
with 

staged as (
  select * from {{ref('stg_ny_sedd_2018_core')}}
  union
  select * from {{ref('stg_ny_sedd_2017_core')}}
),

int as (
  select 
  *,
  {{dx_flag_flu()}} AS flu,
  {{dx_flag_flu_like()}} AS flu_like, 
  from staged
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
  from int
)

select * from final


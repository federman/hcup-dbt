{{ config(materialized='external', format =  target.schema) }}
with 

staged as (
  select * from {{ref('base__az_sid_2016_core')}}
  union
  select * from {{ref('base__az_sid_2017_core')}}
  union
  select * from {{ref('base__az_sid_2018_core')}}
  union
  select * from {{ref('base__az_sid_2019_core')}}
  union
  select * from {{ref('base__ga_sid_2016_core')}}
  union
  select * from {{ref('base__ga_sid_2017_core')}}
  union
  select * from {{ref('base__ga_sid_2018_core')}}
  union
  select * from {{ref('base__ga_sid_2019_core')}}
  union
  select * from {{ref('base__nj_sid_2016_core')}}
  union
  select * from {{ref('base__nj_sid_2017_core')}}
  union
  select * from {{ref('base__ny_sid_2017_core')}}
  union
  select * from {{ref('base__ny_sid_2018_core')}}
),

int as (
  select 
  *,
  {{dx_flag_flu(db="SID")}} AS flu,
  {{dx_flag_flu_like(db="SID")}} AS flu_like, 
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


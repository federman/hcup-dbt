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

final as (
  select 
  *,
  {{recode_race_ethnicity()}} AS race_ethnicity, 
  {{recode_insurance()}} AS insurance, 
  from staged
)

select * from final


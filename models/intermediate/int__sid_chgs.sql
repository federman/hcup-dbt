{{ config(materialized='external', format =  target.schema) }}
with 

staged as (
      select * from {{ref('base__az_sid_2016_chgs')}}
      union
      select * from {{ref('base__az_sid_2017_chgs')}}
      union
      select * from {{ref('base__az_sid_2018_chgs')}}
      union
      select * from {{ref('base__az_sid_2019_chgs')}}
      union
      select * from {{ref('base__ga_sid_2016_chgs')}}
      union
      select * from {{ref('base__ga_sid_2017_chgs')}}
      union
      select * from {{ref('base__ga_sid_2018_chgs')}}
      union
      select * from {{ref('base__ga_sid_2019_chgs')}}
      union
      select * from {{ref('base__nj_sid_2016_chgs')}}
      union
      select * from {{ref('base__nj_sid_2017_chgs')}}
      union
      select * from {{ref('base__ny_sid_2017_chgs')}}
      union
      select * from {{ref('base__ny_sid_2018_chgs')}}
),

final as (
  select 
  KEY,
  CHARGE
  from staged
  where CHARGE IS NOT NULL
  )

select * from final


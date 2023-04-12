{{ config(materialized='external', format =  target.schema) }}
with 

final as (
  select 
    *,
    total_ip_charge_place / n_ip_encounters_place AS mean_chrg_per_encounter
  from {{ref('int__flu_ip_cost_zcta_merged')}}
)
 
select * from final


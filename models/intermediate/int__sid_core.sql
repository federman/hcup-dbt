{{ config(materialized='external', format =  target.schema) }}
with 

cte_1 as (
  select 
    CASE WHEN LENGTH(ZIP) = 5 THEN ZIP ELSE NULL END AS ZIP,
    *,
    from 
      (
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
    )
),

cte_2 as (
  select 
  *,
  from cte_1
  left join {{ref('xwalk_zip_urban')}} as xwalk_zip_urban
  on cte_1.ZIP = xwalk_zip_urban.ZIP
  left join {{ref('xwalk_zip_zcta')}} as xwalk_zip_zcta
  on cte_1.ZIP = xwalk_zip_zcta.ZIP
),

cte_3 as (
  select 
    AGE,
    AMONTH,
    AYEAR,
    CPT1,
    CPT2,
    CPT3,
    CPTCCS1,
    CPTCCS2,
    DHOUR,
    DIED,
    DISP_X,
    DISPUB04,
    DMONTH,
    DQTR,
    DRG,
    DSHOSPID,
    FEMALE,
    HCUP_ED,
    HCUP_OS,
    HISPANIC,
    HOSP_NPI,
    HOSPST,
    I10_DX_Admitting,
    I10_DX1,
    I10_DX2,
    KEY,
    LOS,
    PAY1,
    PSTCO,
    PSTCO2,
    RACE,
    VisitLink,
    ZIP,
    ZIP3,
    ZIPINC_QRTL,
    db,
    file,
    RUCA,
    urban,
    ZCTA
  from cte_2
),

final as (
  select 
  *,
  {{recode_race_ethnicity()}} AS race_ethnicity, 
  {{recode_insurance()}} AS insurance, 
  from cte_3
)

select * from final


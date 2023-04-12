{{ config(materialized='external', format =  target.schema) }}
with 

cte_1 as (
  select 
    CASE WHEN ZIP = '' THEN NULL ELSE ZIP END AS ZIP,
    *,
    from 
      (
         select * from {{ref('base__ny_sedd_2017_core')}}
         union
         select * from {{ref('base__ny_sedd_2018_core')}}
         )
),

cte_2 as (
  select 
  *,
  from cte_1
  left join {{ref('xwalk_zip_zcta')}} as xwalk_zip_zcta
  on cte_1.ZIP = xwalk_zip_zcta.ZIP
),

cte_3 as (
  select 
    AGE,
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
    DSHOSPID,
    FEMALE,
    HCUP_ED,
    HCUP_OS,
    HISPANIC,
    HOSP_NPI,
    HOSPST,
    I10_DX_Visit_Reason1,
    I10_DX_Visit_Reason2,
    I10_DX1,
    I10_DX2,
    KEY,
    LOS,
    PAY1,
    PSTCO,
    PSTCO2,
    RACE,
    VisitLink,
    YEAR,
    ZIP,
    ZIP3,
    ZIPINC_QRTL,
    db,
    file,
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


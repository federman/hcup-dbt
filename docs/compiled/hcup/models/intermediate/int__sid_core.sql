
with 

cte_1 as (
  select 
    CASE WHEN LENGTH(ZIP) = 5 THEN ZIP ELSE NULL END AS ZIP,
    *,
    from 
      (
      select * from "main"."parquet"."base__az_sid_2016_core"
      union
      select * from "main"."parquet"."base__az_sid_2017_core"
      union
      select * from "main"."parquet"."base__az_sid_2018_core"
      union
      select * from "main"."parquet"."base__az_sid_2019_core"
      union
      select * from "main"."parquet"."base__ga_sid_2016_core"
      union
      select * from "main"."parquet"."base__ga_sid_2017_core"
      union
      select * from "main"."parquet"."base__ga_sid_2018_core"
      union
      select * from "main"."parquet"."base__ga_sid_2019_core"
      union
      select * from "main"."parquet"."base__nj_sid_2016_core"
      union
      select * from "main"."parquet"."base__nj_sid_2017_core"
      union
      select * from "main"."parquet"."base__ny_sid_2017_core"
      union
      select * from "main"."parquet"."base__ny_sid_2018_core"
    )
),

cte_2 as (
  select 
  *,
  from cte_1
  left join "main"."parquet"."xwalk_zip_urban" as xwalk_zip_urban
  on cte_1.ZIP = xwalk_zip_urban.ZIP
  left join "main"."parquet"."xwalk_zip_zcta" as xwalk_zip_zcta
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
  CASE
    WHEN RACE = '1' THEN 'NHW'
    WHEN RACE = '2' THEN 'NHB'
    WHEN RACE = '3' THEN 'HISP'
    WHEN RACE = '4' THEN 'NHAPI'
    WHEN RACE = '5' THEN 'NHAIAN'
    WHEN RACE = '6' THEN 'NHOTHER'
    ELSE NULL
    END AS race_ethnicity, 
  CASE
    WHEN PAY1 = '1' THEN 'Medicare'
    WHEN PAY1 = '2' THEN 'Medicaid'
    WHEN PAY1 = '3' THEN 'Private insurance'
    WHEN PAY1 = '4' THEN 'Self-pay'
    WHEN PAY1 = '5' THEN 'No charge'
    WHEN PAY1 = '6' THEN 'Other'
    ELSE NULL
    END AS insurance, 
  from cte_3
)

select * from final
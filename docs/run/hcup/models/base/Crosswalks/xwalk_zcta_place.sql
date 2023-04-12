create or replace view "parquet"."xwalk_zcta_place__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/xwalk_zcta_place.parquet'
    );
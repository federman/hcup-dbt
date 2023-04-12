create or replace view "parquet"."xwalk_zip_zcta__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/xwalk_zip_zcta.parquet'
    );
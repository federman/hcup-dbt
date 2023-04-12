create or replace view "parquet"."xwalk_zip_urban__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/xwalk_zip_urban.parquet'
    );
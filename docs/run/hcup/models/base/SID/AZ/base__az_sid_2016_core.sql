create or replace view "parquet"."base__az_sid_2016_core__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/base__az_sid_2016_core.parquet'
    );
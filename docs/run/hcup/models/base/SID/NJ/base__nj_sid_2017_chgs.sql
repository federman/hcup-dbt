create or replace view "parquet"."base__nj_sid_2017_chgs__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/base__nj_sid_2017_chgs.parquet'
    );
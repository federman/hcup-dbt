create or replace view "parquet"."base__ny_sid_2017_chgs__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/base__ny_sid_2017_chgs.parquet'
    );
create or replace view "parquet"."int__sid_chgs__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/int__sid_chgs.parquet'
    );
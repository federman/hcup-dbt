create or replace view "parquet"."base__ny_sedd_2018_core__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/base__ny_sedd_2018_core.parquet'
    );
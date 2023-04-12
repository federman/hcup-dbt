create or replace view "parquet"."int__sedd_core__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/int__sedd_core.parquet'
    );
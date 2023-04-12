create or replace view "parquet"."int__flu_er__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/int__flu_er.parquet'
    );
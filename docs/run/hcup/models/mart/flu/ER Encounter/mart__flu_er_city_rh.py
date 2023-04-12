create or replace view "parquet"."mart__flu_er_city_rh__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/mart__flu_er_city_rh.parquet'
    );
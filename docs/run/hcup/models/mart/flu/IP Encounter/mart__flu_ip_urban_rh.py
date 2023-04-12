create or replace view "parquet"."mart__flu_ip_urban_rh__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/mart__flu_ip_urban_rh.parquet'
    );
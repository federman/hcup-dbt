create or replace view "parquet"."mart__flu_ip_cost_zcta__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/mart__flu_ip_cost_zcta.parquet'
    );
create or replace view "parquet"."int__flu_ip_cost_zcta_count__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/int__flu_ip_cost_zcta_count.parquet'
    );
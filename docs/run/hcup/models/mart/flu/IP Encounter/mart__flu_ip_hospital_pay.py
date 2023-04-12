create or replace view "parquet"."mart__flu_ip_hospital_pay__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/mart__flu_ip_hospital_pay.csv'
    );
create or replace view "parquet"."mart__flu_er_patient_city__dbt_int" as (
        select * from 'D:\git\hcup-dbt\external\ran\/mart__flu_er_patient_city.parquet'
    );
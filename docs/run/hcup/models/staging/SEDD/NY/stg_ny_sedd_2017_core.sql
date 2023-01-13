create or replace view "csv"."stg_ny_sedd_2017_core__dbt_int" as (
        select * from 'C:\Users\rl627\Desktop\Git\hcup-dbt\external\dev\/stg_ny_sedd_2017_core.csv'
    );
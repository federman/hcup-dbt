create or replace view "csv"."int_sedd_flu_line_level__dbt_int" as (
        select * from 'C:\Users\rl627\Desktop\Git\hcup-dbt\external\dev\/int_sedd_flu_line_level.csv'
    );
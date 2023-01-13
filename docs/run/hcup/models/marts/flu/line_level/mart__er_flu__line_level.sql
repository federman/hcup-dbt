create or replace view "csv"."mart__er_flu__line_level__dbt_int" as (
        select * from 'C:\Users\rl627\Desktop\Git\hcup-dbt\external\dev\/mart__er_flu__line_level.csv'
    );
create or replace view "main"."test__dbt_int" as (
        select * from '\\files.drexel.edu\encrypted\SOPH\UHC\SchnakeMahl_HCUP\dbt\v0\models\/test.csv'
    );
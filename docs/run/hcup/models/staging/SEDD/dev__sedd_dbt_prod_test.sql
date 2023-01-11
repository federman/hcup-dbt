create or replace view "main"."dev__sedd_dbt_prod_test__dbt_int" as (
        select * from '\\files.drexel.edu\encrypted\SOPH\UHC\SchnakeMahl_HCUP\dbt\v0\models\/dev__sedd_dbt_prod_test.csv'
    );
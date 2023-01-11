create or replace view "main"."stg_sedd_2017_core__dbt_int" as (
        select * from '\\files.drexel.edu\encrypted\SOPH\UHC\SchnakeMahl_HCUP\dbt\v0\models\/stg_sedd_2017_core.csv'
    );
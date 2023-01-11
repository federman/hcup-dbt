{{ config(materialized='external', format = 'csv') }}
SELECT  *
FROM {{ source('SEDD', 'NY_SEDD_2017_CHGS') }}
LIMIT 20
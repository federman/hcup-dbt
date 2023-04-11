{{ config(materialized='external', format =  target.schema) }}
SELECT *
FROM {{ source('Crosswalks', 'xwalk_zip_urban') }}
 
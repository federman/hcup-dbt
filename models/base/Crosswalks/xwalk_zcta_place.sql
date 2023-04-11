{{ config(materialized='external', format =  target.schema) }}
SELECT *
FROM {{ source('Crosswalks', 'xwalk_zcta_place') }}
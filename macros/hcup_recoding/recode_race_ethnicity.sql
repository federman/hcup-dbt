{%- macro recode_race_ethnicity() -%}
  
 CASE
    WHEN RACE = '1' THEN 'NHW'
    WHEN RACE = '2' THEN 'NHB'
    WHEN RACE = '3' THEN 'HISP'
    WHEN RACE = '4' THEN 'NHAPI'
    WHEN RACE = '5' THEN 'NHAIAN'
    WHEN RACE = '6' THEN 'NHOTHER'
    ELSE NULL
    END


{%- endmacro -%}

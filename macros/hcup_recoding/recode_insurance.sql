{%- macro recode_insurance() -%}
  
 CASE
    WHEN PAY1 = '1' THEN 'Medicare'
    WHEN PAY1 = '2' THEN 'Medicaid'
    WHEN PAY1 = '3' THEN 'Private insurance'
    WHEN PAY1 = '4' THEN 'Self-pay'
    WHEN PAY1 = '5' THEN 'No charge'
    WHEN PAY1 = '6' THEN 'Other'
    ELSE NULL
    END


{%- endmacro -%}

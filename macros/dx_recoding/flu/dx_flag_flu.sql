{%- macro dx_flag_flu() -%}
 
    {% set flu_codes = ('J1000', 'J1001', 'J1008', 'J101', 'J102', 'J1081', 'J1082', 'J1083', 'J1089', 'J1100', 'J1108', 'J111', 'J112', 'J1181', 'J1182', 'J1183', 'J1189', 'J09X1', 'J09X2', 'J09X3', 'J09X9')   %}
    
    I10_DX_Visit_Reason1 IN {{flu_codes}} OR I10_DX_Visit_Reason2 IN {{flu_codes}} OR I10_DX1 IN {{flu_codes}} OR I10_DX2 IN {{flu_codes}}

{%- endmacro -%}

{%- macro dx_flag_flu_like() -%}
 
    {% set flu_like_codes = ('J069', 'J399', 'J200', 'J201', 'J202', 'J203', 'J204', 'J205', 'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40', 'B012', 'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129', 'J440', 'J441', 'J470', 'J471')   %}
    
    I10_DX_Visit_Reason1 IN {{flu_like_codes}} OR I10_DX_Visit_Reason2 IN {{flu_like_codes}} OR I10_DX1 IN {{flu_like_codes}} OR I10_DX2 IN {{flu_like_codes}}

{%- endmacro -%}

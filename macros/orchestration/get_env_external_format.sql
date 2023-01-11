{% macro get_env_external_format() %}
  {% if target.name == 'stage' %}
    'csv'
    {% else %}       
    'parquet'
  {% endif %}
{% endmacro %}
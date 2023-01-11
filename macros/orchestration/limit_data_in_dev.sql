{% macro limit_data_in_dev(x = 25) %}
  {% if not  target.name == 'prod' %}
  order by RANDOM()
  limit {{x}}
  {% endif %}
{% endmacro %}
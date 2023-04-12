{% macro limit_chgs_in_dev(core_model) %}
  {% if not  target.name == 'prod' %}
  WHERE KEY IN (SELECT KEY FROM {{ ref(core_model) }})
  {% endif %}
{% endmacro %}
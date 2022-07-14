{% macro limit_data_in_dev(column_name) %}

{% if target.name == 'dev_jwang' %}
where {{column_name}} >=dateadd('day', -3, current_timestamp)
{% endif %}
{% endmacro %}

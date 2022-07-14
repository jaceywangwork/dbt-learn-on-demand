{% macro limit_data_in_dev(column_name) %}

{% if target.name == 'dev_jwang' %}
where {{column_name}} >=cast(dateadd('day', -3, getdate()) as date)
{% endif %}
{% endmacro %}


--redshift do not use currentdate, currenttimstamp

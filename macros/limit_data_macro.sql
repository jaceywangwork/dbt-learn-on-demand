{% macro limit_data_in_dev(column_name) %}

{% if target.name == 'dev_jwang' %}
where {{column_name}} >=cast(dateadd('day', -3, getdate()) as date)
{% endif %}
{% endmacro %}


--redshift do not use currentdate, currenttimstamp

--assign dynamic dev day

--uncomment below to run
-- {% macro limit_data_in_dev(column_name,dev_day_of_data=3) %}

-- {% if target.name == 'dev_jwang' %}
-- where {{column_name}} >=cast(dateadd('day', -{{dev_day_of_data}}, getdate()) as date)

-- {% endif %}

-- {% endmacro %}



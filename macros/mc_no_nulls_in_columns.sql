{% macro no_nulls_in_columns(model_name) %} 
    SELECT 
    * 
    FROM {{ model_name }} WHERE 
    {% for col in adapter.get_columns_in_relation(model_name) -%} 
        {{ col.column }} IS NULL OR 
    {% endfor %} 
    FALSE 
{% endmacro %}

{#
{% macro mc_no_nulls_in_columns (model_name)%}
    {%- set columns = adapter.get_columns_in_relation(model_name) -%}
    SELECT 
        {% for column in columns %}
       {{ column.name }}{% if not loop.last %}, {% endif %}
        {% endfor %}
    FROM {{ model_name }}    
{% endmacro %}
#}
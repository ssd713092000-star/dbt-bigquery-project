{% test array_not_empty(model, column_name) %}
select *
from {{ model }}
where array_length({{ column_name }}) = 0
{% endtest %}

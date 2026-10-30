{% test is_clean_text(model, column_name) %}
-- fails on values that are not lowercase and trimmed
select *
from {{ model }}
where {{ column_name }} != lower(trim({{ column_name }}))
{% endtest %}

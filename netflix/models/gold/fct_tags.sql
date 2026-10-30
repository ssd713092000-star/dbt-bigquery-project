select
    user_id,
    movie_id,
    tag AS tag_name,
    tagged_at
from {{ ref('int_tags_cleaned') }}
select
    user_id,
    movie_id,
    rating,
    rated_at
from {{ ref('int_ratings_cleaned') }}
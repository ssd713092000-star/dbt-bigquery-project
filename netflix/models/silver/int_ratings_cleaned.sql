select
    user_id,
    movie_id,
    rating,
    rated_at
from {{ ref('stg_ratings') }}
where rating between 0.5 and 5.0
  and user_id is not null
  and movie_id is not null
qualify row_number() over (
    partition by user_id, movie_id
    order by rated_at desc
) = 1
select
    movie_id,
    genre
from {{ ref('int_movies_genres') }}
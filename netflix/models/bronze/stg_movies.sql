select
    movieId as movie_id,
    title,
    genres
from {{ source('test_source', 'movies') }}
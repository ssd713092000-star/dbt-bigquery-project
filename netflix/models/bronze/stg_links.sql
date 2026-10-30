select
    movieId as movie_id,
    imdbId as imdb_id,
    tmdbId as tmdb_id
from {{ source('test_source', 'links') }}
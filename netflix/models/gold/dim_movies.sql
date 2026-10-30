select
    m.movie_id,
    m.title as title,
    m.genre_array,
    l.imdb_code,
    l.imdb_url,
    l.tmdb_id,
    l.has_tmdb_link
from {{ ref('int_movies_cleaned') }} m
left join {{ ref('int_links_cleaned') }} l
    on m.movie_id = l.movie_id
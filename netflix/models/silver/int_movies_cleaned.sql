select
    movie_id,
    title,
    case
        when genres = '(no genres listed)' then ['Unknown']
        else split(genres, '|')
    end as genre_array
from {{ ref('stg_movies') }}
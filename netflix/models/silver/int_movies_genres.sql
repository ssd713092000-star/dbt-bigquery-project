select
    movie_id,
    genre
from {{ ref('stg_movies') }},
unnest(
    case
        when genres = '(no genres listed)' then ['Unknown']
        else split(genres, '|')
    end
) as genre
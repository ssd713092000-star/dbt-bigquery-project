select
    movie_id,
    imdb_id,
    -- Turns 48420 into 'tt0048420' and 1141486 into 'tt1141486'
    concat('tt', lpad(cast(imdb_id as string), 7, '0')) as imdb_code,
    -- Build the full clickable IMDb URL!
    concat('https://www.imdb.com/title/tt', lpad(cast(imdb_id as string), 7, '0'), '/') as imdb_url,
    tmdb_id,
    -- Flag whether tmdb_id is missing
    case 
        when tmdb_id is null then false 
        else true 
    end as has_tmdb_link
from {{ ref('stg_links') }}
where movie_id is not null
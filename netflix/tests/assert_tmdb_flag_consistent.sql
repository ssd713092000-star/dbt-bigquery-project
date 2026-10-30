select *
from {{ ref('dim_movies') }}
where has_tmdb_link != (tmdb_id is not null)

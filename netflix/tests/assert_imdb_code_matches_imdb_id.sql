-- imdb_code must encode the full imdb_id (catches lpad truncating 8-digit ids)
select movie_id, imdb_id, imdb_code
from {{ ref('int_links_cleaned') }}
where cast(substr(imdb_code, 3) as int64) != imdb_id

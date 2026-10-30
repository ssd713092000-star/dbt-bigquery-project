-- each movie must have exactly one open (current) version
select movie_id, count(*) as current_versions
from {{ ref('dim_movies_scd2') }}
where is_current
group by movie_id
having count(*) != 1

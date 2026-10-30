-- every movie has one bridge row per genre in its genre_array
select d.movie_id
from {{ ref('dim_movies') }} d
left join (
    select movie_id, count(*) as n
    from {{ ref('brg_movie_genres') }}
    group by movie_id
) b using (movie_id)
where coalesce(b.n, 0) != array_length(d.genre_array)

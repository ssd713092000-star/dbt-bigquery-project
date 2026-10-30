-- silver filter + dedup keeps exactly one row per valid user/movie pair
select *
from (
    select
        (
            select count(distinct concat(cast(user_id as string), '-', cast(movie_id as string)))
            from {{ ref('stg_ratings') }}
            where rating between 0.5 and 5.0
              and user_id is not null
              and movie_id is not null
        ) as expected_rows,
        (select count(*) from {{ ref('fct_ratings') }}) as actual_rows
)
where expected_rows != actual_rows

-- the links join must not add or drop movies
select *
from (
    select
        (select count(*) from {{ ref('dim_movies') }}) as dim_rows,
        (select count(*) from {{ ref('int_movies_cleaned') }}) as source_rows
)
where dim_rows != source_rows

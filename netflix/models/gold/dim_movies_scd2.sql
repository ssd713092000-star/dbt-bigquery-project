select
    dbt_scd_id as movie_version_key,
    movie_id,
    title,
    genres,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    dbt_valid_to is null as is_current
from {{ ref('movies_snapshot') }}

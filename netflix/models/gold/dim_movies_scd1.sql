{{
    config(
        materialized='incremental',
        unique_key='movie_id',
        incremental_strategy='merge'
    )
}}

with source_movies as (

    select
        movie_id,
        title,
        genres,
        -- fingerprint of the tracked columns, used to detect changes
        to_hex(md5(concat(coalesce(title, ''), '|', coalesce(genres, '')))) as row_hash
    from {{ ref('stg_movies') }}

)

select
    s.*,
    current_timestamp() as updated_at
from source_movies s
{% if is_incremental() %}
-- only new movies or movies whose values changed; merge overwrites the old row
left join {{ this }} t
    on s.movie_id = t.movie_id
where t.movie_id is null
   or t.row_hash != s.row_hash
{% endif %}

select
    userId as user_id,
    movieId as movie_id,
    tag,
    TIMESTAMP_SECONDS(timestamp) as tagged_at
from {{ source('test_source', 'tags') }}
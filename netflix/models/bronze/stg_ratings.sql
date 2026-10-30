select
    userId as user_id,
    movieId as movie_id,
    rating,
    TIMESTAMP_SECONDS(timestamp) as rated_at
from {{ source('test_source', 'ratings') }}
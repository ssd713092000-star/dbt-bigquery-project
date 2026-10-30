
WITH bronze AS (

    SELECT *
    FROM {{ ref('stg_tags') }}

),

cleaned AS (

    SELECT
        CAST(user_id AS INTEGER) AS user_id,
        CAST(movie_id AS INTEGER) AS movie_id,

        LOWER(TRIM(tag)) AS tag,

        CAST(tagged_at AS TIMESTAMP) AS tagged_at

    FROM bronze

    WHERE user_id IS NOT NULL
      AND movie_id IS NOT NULL
      AND tag IS NOT NULL
      AND TRIM(tag) != ''

),

deduplicated AS (

    SELECT *
    FROM cleaned

    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY
            user_id,
            movie_id,
            tag,
            tagged_at
        ORDER BY tagged_at DESC
    ) = 1

)

SELECT *
FROM deduplicated

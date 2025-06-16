WITH minimum_nights AS (
    SELECT
    *
    FROM
    {{ ref('int_listings_cleansed') }}
    WHERE minimum_nights <1
)
SELECT * FROM minimum_nights
WITH fullmoon_reviews AS (
SELECT
    is_full_moon,
    review_sentiment,
    COUNT(*) as reviews
FROM {{ ref('mart_fullmoon_reviews') }}
GROUP BY
is_full_moon,
review_sentiment
ORDER BY
is_full_moon,
review_sentiment 
)
 SELECT * FROM fullmoon_reviews
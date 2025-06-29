WITH consistent_created_at AS (
    SELECT
    *
    FROM 
    {{ ref('int_listings_cleansed') }} l
    INNER JOIN 
    {{ ref('int_reviews') }} r
    ON l.listing_id= r.listing_id
    WHERE 
    l.created_at >= r.review_date
) 
SELECT * FROM consistent_created_at
with
raw_reviews as (
    select 
    listing_id, 
    date AS review_date, 
    reviewer_name, 
    comments AS review_txt, 
    sentiment AS review_sentiment
    from {{ source("RAW", "RAW_REVIEWS") }}
)
select *
from raw_reviews

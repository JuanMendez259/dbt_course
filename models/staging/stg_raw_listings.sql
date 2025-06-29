-- import raw_listings
with
raw_listings as (
    select
        id AS listing_id,
        listing_url,
        name AS listing_name,
        room_type,
        minimum_nights,
        host_id,
        price AS price_str,
        created_at,
        updated_at
    from {{ source("RAW", "RAW_LISTINGS") }}
)
select *
from raw_listings

with
listings_w_hosts as (
    select
        l.listing_id,
        l.listing_name,
        l.room_type,
        l.minimum_nights,
        l.price,
        l.host_id,
        h.host_name,
        h.is_superhost as host_is_superhost,
        l.created_at,
        greatest(l.updated_at, h.updated_at) as updated_at
    from {{ ref("int_hosts_cleansed") }} h
    left join {{ ref("int_listings_cleansed") }} l on l.host_id = h.host_id
)
select * from listings_w_hosts

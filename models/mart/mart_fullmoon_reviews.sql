{{ config(materialized="table") }}

with
fullmoon_reviews as (
    select
        r.*,
        case
            when fm.full_moon_date is null 
                then 'not full moon' else 'full moon'
        end as is_full_moon
    from {{ ref("int_reviews") }} r
    left join
        {{ ref("seed_full_moon_dates") }} fm
    on (to_date(r.review_date) = dateadd(day, 1, fm.full_moon_date))
)
select * from fullmoon_reviews

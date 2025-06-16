{{ 
  config( 
    materialized = 'incremental', 
    on_schema_change='fail' 
    ) 
}} 

WITH reviews AS (
    SELECT
    *
    FROM {{ ref('stg_raw_reviews') }}
    WHERE review_txt IS NOT NULL
)
SELECT * FROM reviews

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where review_date > (select max(review_date) from {{ this }})
{% endif %}
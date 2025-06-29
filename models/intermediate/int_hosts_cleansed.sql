{{
  config(
    materialized = 'view'
    )
}} 

WITH hosts_cleansed AS (
SELECT
    host_id,
    NVL(host_name, 'Anonymous' ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    {{ ref('stg_raw_hosts') }}
)
SELECT * FROM hosts_cleansed
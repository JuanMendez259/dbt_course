WITH raw_hosts AS (
    
    SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    {{ source('RAW', 'RAW_HOSTS') }}
)
SELECT * FROM raw_hosts
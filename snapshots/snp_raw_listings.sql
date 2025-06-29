{% snapshot snp_raw_listings %}
    {{
        config(
            target_schema='RAW',
            target_database='AIRBNB',
            unique_key='id',
            strategy='timestamp',
            invalidate_hard_deletes=True,
            updated_at='updated_at'
        )
    }}

    select * from {{ source('RAW', 'RAW_LISTINGS') }}
 {% endsnapshot %}
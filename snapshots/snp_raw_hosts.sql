{% snapshot snapshot_name %}
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

    select * from {{ source('RAW', 'RAW_HOSTS') }}
{% endsnapshot %}

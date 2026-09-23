{% snapshot orders_snapshot %}

{{ config (unique_key='ORDER_ID',strategy='timestamp',updated_at='ORDER_UPDATED_DATE')}}

select * from raw_data.orders

{% endsnapshot %}
{% snapshot product_snapshot %}

{{ config (unique_key='PRODUCT_ID',strategy='check',check_cols=['product_name', 'category', 'price', 'stock_quantity'])}}

select * from raw_data.products

{% endsnapshot %}
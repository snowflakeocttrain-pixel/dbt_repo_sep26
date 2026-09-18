{% macro add_etl_columns() %}

    current_timestamp() as etl_created_at,
     current_timestamp() as etl_updated_at,
     current_user() as etl_inserted_by

{% endmacro %}     
{% macro insert_audit_recors(model_name,status) %}
insert into curated_data.audit_tbl values('{{model_name}}','{{status}}',current_timestamp())
{% endmacro %}
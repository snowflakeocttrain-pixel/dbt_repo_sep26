{{ config(materialized='incremental',
          alias='DEPT_INCREMENTAL',
          unique_key='department_id')}}

select     department_id ,
    department_name,
    location  from RAW_DATA.s_dept 

{% if is_incremental() %}
-- this filter will only be applied on an incremental run
where METADATA$ACTION!='DELETE'
{% endif %}
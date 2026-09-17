{{ config(materialized='incremental',
          alias='EMP_INCREMENTAL',
          unique_key='employee_id')}}

select
employee_id, employee_name, department_id, manager_id, job_title, salary, hire_date
 from RAW_DATA.S_EMP

{% if is_incremental() %}
-- this filter will only be applied on an incremental run
where METADATA$ACTION!='DELETE'
{% endif %}
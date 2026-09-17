{{ config(materialized='incremental',
          alias='EMP_INCREMENTAL_TS',
          unique_key='employee_id')}}

select
* from RAW_DATA.EMPLOYEE_TS

{% if is_incremental() %}
-- this filter will only be applied on an incremental run
where updated_at > (select max(updated_at) from {{this}} )
{% endif %}
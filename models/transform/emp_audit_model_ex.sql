   {{ config (materialized='table',
   pre_hook=["{{set_wh('large')}}"],
   post_hook=["{{insert_audit_recors('emp_audit_model_ex','completed')}}"])}}
   
    select department_name,
    {{ add_etl_columns()}},
    count(*) as employee_count 
    from raw_data.employee e,raw_data.department d 
    where e.department_id=d.department_id
    group by department_name
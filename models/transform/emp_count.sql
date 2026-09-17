   
   {{ config (materialized='table',
   pre_hook=["insert into curated_data.audit_tbl values('emp_count','started',current_timestamp)"],
   post_hook=["insert into curated_data.audit_tbl values('emp_count','completed',current_timestamp)","grant select on CURATED_DATA.EMP_COUNT to SYSADMIN"])}}
   
    select department_name,count(*) as employee_count 
    from raw_data.employee e,raw_data.department d 
    where e.department_id=d.department_id
    group by department_name
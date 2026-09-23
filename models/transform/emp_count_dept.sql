{{ config (materialized='table',alias='emp_count_by_dept',pre_hook="{{unique_records('EMPLOYEE_UNIQUE','EMPLOYEE_ID','NA','EMPLOYEE')}}")}}

select department_id,count(*) as emp_count from CURATED_DATA.EMPLOYEE_UNIQUE
group by 1
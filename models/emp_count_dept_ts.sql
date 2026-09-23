{{ config (materialized='table',alias='emp_count_by_dept_ts',pre_hook="{{unique_records('EMPLOYEE_UNIQUE_TS','EMPLOYEE_ID','updated_at','EMPLOYEE_TS')}}")}}

select department_id,count(*) as emp_count from CURATED_DATA.EMPLOYEE_UNIQUE_TS
group by 1
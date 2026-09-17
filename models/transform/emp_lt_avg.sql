select e.employee_name,e.salary,d.avg_sal,'more than' as label from raw_data.employee e , {{ref('dept_avg')}} d
where e.salary<d.avg_sal and e.department_id=d.department_id
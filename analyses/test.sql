
select d.department_id,department_name,avg(salary) as avg_sal
from raw_data.department d  join raw_data.employee e on (d.department_id=e.department_id)
group by 1,2
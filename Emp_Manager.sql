select * from employee e inner join employee m
on e.manager_id = m.emp_id
where e.salary > m.salary
order by e.emp_id

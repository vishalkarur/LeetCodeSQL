1.To find duplicates in a table
  select emp_id , count(*)
  from top
  group by emp_id
  having count(*)>1
  
2.Delete duplicate values
  with cte as (select top.* , row_number() over (partition by emp_id ) row_no
  from top)
  delete from cte where row_no > 1
  
3.Employees who are not in department table 
  select * from employee where dept_id not in (select dept_id from department )
  or
  select * from emp e left join dept d on e.dept_id = d.dept_id where d.dept_id is null 
  
4.second highest salary in each department
  with cte as (select * , dense_rank() over (partition by department_id order by salary desc) rnk
  from top )
  select * from cte where rnk=2
    

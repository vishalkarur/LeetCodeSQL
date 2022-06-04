create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);


insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);

***********************************************************

select * from emp_compensation;

with cte as (select emp_id , case when salary_component_type= 'salary' then val end as salary,
case when salary_component_type= 'bonus' then val end as bonus,
case when salary_component_type= 'hike_percent' then val end as hike_percent
from emp_compensation )
select emp_id , sum(salary) as salary , sum(bonus) as bonus , sum(hike_percent) as hike_percent
from cte
group by emp_id

*************************************************unpivot

select empp_id , 
'salary' as  salary_component_type , salary as val 
from pivot
union 
select empp_id , 
'bonus' as  salary_component_type , bonus as val 
from pivot
union
select empp_id , 
'hike_percent' as  salary_component_type , hike_percent as val 
from pivot
order by empp_id

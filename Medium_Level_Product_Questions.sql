create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')

with floor_visit as (select name , floor , count(*) no_of_floor_visit,
rank() over (partition by name order by count(*) desc ) as rn
from entries
group by name , floor ) , total_visits as (select name ,  count(*) as total_visits , group_concat(distinct resources) as gp
from entries
group by name )
select fv.name , tv.total_visits , fv.floor as most_visited_floor , tv.gp
from floor_visit fv 
inner join total_visits tv on tv.name = fv.name
where rn = 1 ;


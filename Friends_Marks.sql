with cte as (select f.personid, count(*) no_of_friends ,
sum(p.score)  total_marks_of_friends
from friend f inner join person p
on f.friendid = p.personid
group by f.personid
having sum(p.score) > 100 )
select * from cte inner join person pp
on pp.personid = cte.personid;

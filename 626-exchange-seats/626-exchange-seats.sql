with cte as (
select id, student, case when mod(id,2) = 0 then id-1 else id+1 end as new_id
from Seat
order by new_id
),
cte2 as (
select student, row_number() over (order by new_id) as rnum
from cte
)
select rnum as "id", student from cte2
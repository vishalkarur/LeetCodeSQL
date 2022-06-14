/*
Table Script:
create table cricket(ball_cnt integer , run varchar2(100));
insert into cricket values(1,4);
insert into cricket values(2,0);
insert into cricket values(3,2);
insert into cricket values(4,1);
insert into cricket values(5,1);
insert into cricket values(6,3);
insert into cricket values(7,6);
insert into cricket values(8,4);
insert into cricket values(9,4);
insert into cricket values(10,0);
insert into cricket values(11,0);
insert into cricket values(12,0);
insert into cricket values(13,1);

Output:
Overs  Runs
1     11
2     14
3     1*/
with cte as ( select ball_cnt , run , ceil(ball_cnt / 6) as overs 
from cricket)
select cte.overs , sum(run) runs
from cte
group by cte.overs
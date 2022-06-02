create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;
********************************************************************************
select team_name , count(*) as no_of_matches_played , sum(win_flag) as no_of_wins , 
count(*) - sum(win_flag) as no_of_losses
from (select team1 team_name, case when team1=winner then 1 else 0 end as win_flag 
from matches
union all
select team2 team_name, case when team2=winner then 1 else 0 end as win_flag 
from matches ) A
group by team_name

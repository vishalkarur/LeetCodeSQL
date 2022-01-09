with cte1 as (
    select id, 
        (id - lag(id,1) over (order by id)) diff_lag1, 
        (id - lag(id,2) over (order by id)) diff_lag2,
        (lead(id,1)  over (order by id) - id) diff_lead1,
        (lead(id,2)  over (order by id) - id) diff_lead2,
        visit_date, people FROM Stadium where people>=100 order by id
)
select id, to_char(visit_date,'YYYY-MM-DD') as visit_date,  people  from cte1 where 
       (diff_lead1=1 and diff_lead2=2)
    OR (diff_lead1=1 and diff_lag1=1)
    OR (diff_lag1=1 and diff_lag2=2)
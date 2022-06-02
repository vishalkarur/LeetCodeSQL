create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);



insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)
;

with cte as (select co.* , A.first_visit_date ,
case when co.order_date = A.first_visit_date then 1 else 0 end as first_visit_flag,
case when co.order_date != A.first_visit_date then 1 else 0 end as repeat_visit_flag
 from customer_orders co inner join 
(select customer_id , min(order_date) first_visit_date
from customer_orders
group by customer_id ) A on co.customer_id = A.customer_id )
select cte.order_date , count(*)  as total_customer_on_that_day,
sum(first_visit_flag) as total_new_customers_on_that_day,
sum(repeat_visit_flag) as total_repeat_customers_on_that_day
from cte
group by order_date

/*Rolling averages and sum*/

SELECT store_id , year(payment_date) payment_year, sum(payment_amount) 
FROM payment 
group by  store_id , year(payment_date) 
union all
SELECT store_id , NULL, sum(payment_amount) 
FROM payment 
group by  store_id 
union all
SELECT  NULL , year(payment_date) payment_year, sum(payment_amount) 
FROM payment 
group by   year(payment_date) 
ORDER BY  store_id
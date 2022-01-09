Select Request_at as "Day",
ROUND(sum(case when status='cancelled_by_driver' or status='cancelled_by_client' then 1 else 0 end)/count(*),2) as "Cancellation Rate" 
FROM Trips 
WHERE Request_at between '2013-10-01' and '2013-10-03'
AND Client_id NOT IN (Select Users_Id from Users where Banned='Yes')
AND Driver_Id NOT IN (Select Users_Id from Users where Banned='Yes')
group by Request_at 
order by Request_at;
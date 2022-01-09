/* Write your PL/SQL query statement below */
SELECT distinct NUM "ConsecutiveNums" FROM (SELECT NUM , LAG(NUM) OVER (ORDER BY ID) AS LAG , LEAD(NUM) OVER (ORDER BY ID) AS LEAD FROM LOGS ) WHERE NUM = LEAD AND LAG = NUM
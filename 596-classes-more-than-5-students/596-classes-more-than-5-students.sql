/* Write your PL/SQL query statement below */

SELECT CLASS "class"
FROM COURSES
GROUP BY CLASS
HAVING COUNT(STUDENT) >= 5;
/* Write your PL/SQL query statement below */

SELECT EMAIL "Email"
FROM PERSON 
GROUP BY EMAIL 
HAVING COUNT(ID) > 1;
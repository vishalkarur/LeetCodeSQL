/* Write your PL/SQL query statement below */

SELECT NAME "name" , POPULATION "population" , AREA "area"
FROM WORLD
WHERE AREA >= 3000000 
OR POPULATION >= 25000000;
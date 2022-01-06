/* Write your PL/SQL query statement below */
SELECT MAX(SALARY) "SecondHighestSalary" 
FROM EMPLOYEE WHERE SALARY <  (SELECT MAX(SALARY) FROM EMPLOYEE )
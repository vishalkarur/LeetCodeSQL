/* Write your PL/SQL query statement below */
SELECT E2.NAME "Employee"
FROM EMPLOYEE E1 , EMPLOYEE E2
WHERE E1.ID = E2.MANAGERID
AND E2.SALARY > E1.SALARY;

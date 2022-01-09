SELECT D.NAME "Department", E1.NAME "Employee", E1.SALARY "Salary"
FROM EMPLOYEE E1 , DEPARTMENT D 
WHERE (DEPARTMENTID , SALARY ) IN 
(SELECT DEPARTMENTID , MAX(E.SALARY) FROM EMPLOYEE E GROUP BY E.DEPARTMENTID ) 
AND E1.DEPARTMENTID = D.ID
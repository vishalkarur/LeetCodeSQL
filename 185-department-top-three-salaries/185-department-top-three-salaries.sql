SELECT D.NAME "Department", ED.NAME "Employee", ED.SALARY "Salary" 
FROM (SELECT E.ID , E.NAME , E.SALARY , E.DEPARTMENTID , DENSE_RANK() OVER (PARTITION BY E.DEPARTMENTID ORDER BY E.SALARY DESC) AS DRANK FROM EMPLOYEE E ) ED , DEPARTMENT D 
WHERE D.ID = ED.DEPARTMENTID AND ED.DRANK <= 3
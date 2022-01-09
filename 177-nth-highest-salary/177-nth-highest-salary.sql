CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    select salary into result from (
        select salary,rownum r1 from
            (select distinct salary from Employee order by salary desc)
        )
    where r1 = n;
    
    RETURN result;
END;
/* Write your PL/SQL query statement below */

UPDATE SALARY S 
SET S.SEX = 
CASE  WHEN SEX = 'm' THEN 'f'
      WHEN SEX = 'f' THEN 'm'
END  ;
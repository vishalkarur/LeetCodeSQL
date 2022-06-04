SET @today_date='2022-05-18';
SET @n=3;
SET @a=6-(WEEKDAY(@today_date)) 
-- First execute above 3 lines
************************************************************

select date_add(date_add(@today_date , interval @a day) , interval @n-1 week)

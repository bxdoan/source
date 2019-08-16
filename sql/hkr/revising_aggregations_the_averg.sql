-- Query the average population of all cities in CITY where District is California.
-- Input Format
-- The CITY table is described as follows:
--       CITY
-- Field          Type
-- ID             NUMBER
-- NAME           Varchar2(17)
-- COUNTRYCODE    Varchar2(3)
-- DISTRICT       Varchar2(20)
-- POPULATIONS    NUMBER
select avg(population) from city where district = 'California'
-- 113000.667

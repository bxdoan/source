-- Query the difference between the maximum and minimum populations in CITY.
-- Input Format
--       CITY
-- Field          Type
-- ID             NUMBER
-- NAME           Varchar2(17)
-- COUNTRYCODE    Varchar2(3)
-- DISTRICT       Varchar2(20)
-- POPULATIONS    NUMBER
select max(population)-min(population) from city 

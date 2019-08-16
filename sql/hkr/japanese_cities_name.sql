-- Query the names of all the Japanese cities in the CITY table.
-- The COUNTRYCODE for Japan is JPN.
--       CITY
-- Field          Type
-- ID             NUMBER
-- NAME           Varchar2(17)
-- COUNTRYCODE    Varchar2(3)
-- DISTRICT       Varchar2(20)
-- POPULATIONS    NUMBER
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN'

-- Query all columns for all American cities in CITY with populations larger than 100000.
-- The CountryCode for America is USA.
--       CITY
-- Field          Type
-- ID             NUMBER
-- NAME           Varchar2(17)
-- COUNTRYCODE    Varchar2(3)
-- DISTRICT       Varchar2(20)
-- POPULATIONS    NUMBER
SELECT * FROM CITY WHERE POPULATION >= 100000 AND COUNTRYCODE = 'USA'

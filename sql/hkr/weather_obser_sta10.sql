-- Query the list of CITY names from STATION that do not end with vowels.
-- You may print the results in any order, but must exclude duplicates from your answer.
-- Input Format
-- The STATION table is described as follows:
--       STATION
-- Field          Type
-- ID             NUMBER
-- CITY           Varchar2(21)
-- STATE          Varchar2(2)
-- LAT_N          NUMBER
-- LONG_W         NUMBER
-- where LAT_N is the northern latitude and LONG_W is the western longitude.
SELECT DISTINCT CITY FROM STATION WHERE right(CITY,1) NOT IN ('a','i','e','o','u')
-- Addison
-- Agency
-- Alanson
-- Albany
-- Albion
-- Algonac

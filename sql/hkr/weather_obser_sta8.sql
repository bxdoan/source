-- Query a list of CITY names from STATION with even ID numbers only.
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
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) IN ('a','i','e','o','u')
and left(city,1) in ('a','i','e','o','u');
-- Acme
-- Aguanga
-- Alba
-- Aliso Viejo
-- Alpine

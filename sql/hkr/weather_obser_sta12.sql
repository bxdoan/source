-- Query the list of CITY names from STATION that either do not start with vowels
--  and do not end with vowels.
-- Your result cannot contain duplicates
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
select distinct city from station where right(city,1) not in ('a','e','u','o','i')
and left(city,1) not in ('a','e','u','o','i');
-- Baker
-- Baldwin
-- Bass Harbor
-- Beaufort

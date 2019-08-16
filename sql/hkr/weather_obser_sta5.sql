-- Query the two cities in STATION with the shortest and longest CITY names,
--  as well as their respective lengths (i.e.: number of characters in the name).
--  If there is more than one smallest or largest city, choose the one that comes
--  first when ordered alphabetically.
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
-- Sample Input
-- Let's say that CITY only has four entries: DEF, ABC, PQRS and WXY
-- Sample Output
-- ABC 3
-- PQRS 4
-- Explanation
-- When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS,
--  and WXY, with the respective lengths  and . The longest-named city is
--  obviously PQRS, but there are  options for shortest-named city; we choose ABC,
-- because it comes first alphabetically.
-- Note
-- You can write two separate queries to get the desired output. It need not be
-- a single query.
Select City,char_LENGTH(City) from Station Order By Length(City), City asc limit 1;
Select City,char_LENGTH(City) from Station Order By Length(City) desc, City desc limit 1;
-- Amo 3
-- Marine On Saint Croix 21
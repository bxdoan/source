-- Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the
--  respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d)
--  are the respective minimum and maximum values of Western Longitude (LONG_W)
--   in STATION.
-- Query the Euclidean Distance between points P1 and P2 and format your
--  answer to display 4 decimal digits.
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
select round(sqrt(power(max(lat_n)- min(lat_n), 2) +
                  power(max(long_w)- min(long_w), 2)), 4)
 from station
-- 184.1616

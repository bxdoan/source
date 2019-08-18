-- A median is defined as a number separating the higher half of a data set from
--  the lower half. Query the median of the Northern Latitudes (LAT_N) from
--  STATION and round your
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
Select round(S.LAT_N,4) mediam from station S where
(select count(Lat_N) from station where Lat_N < S.LAT_N ) =
(select count(Lat_N) from station where Lat_N > S.LAT_N)
-- 83.8913

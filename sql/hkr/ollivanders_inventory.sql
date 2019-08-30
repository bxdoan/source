-- Harry Potter and his friends are at Ollivander's with Ron, finally replacing
-- Charlie's old broken wand.
--
-- Hermione decides the best way to choose is by determining the minimum number
-- of gold galleons needed to buy each non-evil wand of high power and age. Write
-- a query to print the id, age, coins_needed, and power of the wands that Ron's
--  interested in, sorted in order of descending power. If more than one wand has
--  same power, sort the result in order of descending age.
--
-- Input Format
--
-- The following tables contain data on the wands in Ollivander's inventory:
--
-- Wands: The id is the id of the wand, code is the code of the wand,
-- coins_needed is the total number of gold galleons needed to buy the wand,
-- and power denotes the quality of the wand (the higher the power, the better
--    the wand is).
--       Wands
-- Field            Type
-- id              NUMBER
-- code            NUMBER
-- coins_needed    NUMBER
-- power           NUMBER
-- Wands_Property: The code is the code of the wand, age is the age of the wand,
-- and is_evil denotes whether the wand is good for the dark arts. If the value
-- of is_evil is 0, it means that the wand is not evil. The mapping between code
-- and age is one-one, meaning that if there are two pairs,(code1, age1) and
-- (code2, age2) , then code1 # code2 and age1 # age2
--       Submissions
-- Field       Type
-- code       NUMBER
-- age        NUMBER
-- is_evil    NUMBER
-- Sample Output
--
-- 9 45 1647 10
-- 12 17 9897 10
-- 1 20 3688 8
-- 15 40 6018 7
-- 19 20 7651 6
-- 11 40 7587 5
-- 10 20 504 5
-- 18 40 3312 3
-- 20 17 5689 3
-- 5 45 6020 2
-- 14 40 5408 1

select a.id, b.age, a.coins_needed, a.power
from Wands a
inner join Wands_Property b on a.code = b.code
where b.is_evil!=1 and
a.coins_needed = (select min(Wands.coins_needed)
from Wands inner join Wands_Property on Wands.code = Wands_Property.code
where Wands_Property.age=b.age and Wands.power=a.power)
order by a.power desc, b.age desc
-- 1038 496 4789 10
-- 1130 494 9439 10
-- 1315 492 4126 10
-- 9 491 7345 10
-- 858 483 4352 10
-- 1164 481 9831 10
-- 1288 464 4952 10
-- 861 462 8302 10
-- 412 455 5625 10
-- 996 451 8884 10
-- 1608 446 8351 10
-- 1376 443 1735 10
-- 1330 430 5182 10
-- 1633 425 2206 10
-- 1197 419 3468 10
-- 441 416 2508 10
-- 424 413 997 10
-- 1298 397 3810 10
-- 1125 395 2299 10
-- 333 393 926 10

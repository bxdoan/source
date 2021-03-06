-- Query the Name of any student in STUDENTS who scored higher than  Marks.
-- Order your output by the last three characters of each name. If two or more
-- students both have names ending in the same last three characters (i.e.: Bobby,
-- Robby, etc.), secondary sort them by ascending ID.
-- You may print the results in any order, but must exclude duplicates from your answer.
-- Input Format
-- The STUDENTS table is described as follows:
--       STUDENTS
-- Field          Type
-- ID             INTEGER
-- NAME           STRING
-- ID             INTEGER
-- The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
-- Sample Input
-- ID             NAME          MAKRS
-- 1              Ashley        81
-- 2              Samantha      75
-- 3              Julia         76
-- 4              Belvet        84
-- Sample Output
-- Ashley
-- Julia
-- Belvet
-- Explanation
-- Only Ashley, Julia, and Belvet have Marks > 75 . If you look at the last three
-- characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
select name from students where marks > 75 order by right(name,3), id
-- Stuart
-- Kristeen
-- Christene
-- Amina
-- Aamina
-- Priya
-- Heraldo
-- Scarlet
-- Julia
-- Salma
-- Britney
-- Priyanka
-- Samantha
-- Vivek
-- Belvet
-- Devil
-- Evil

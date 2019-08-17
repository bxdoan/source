-- Write a query identifying the type of each record in the TRIANGLES table using
-- its three side lengths. Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
-- Input Format
-- The TRIANGLES table is described as follows:
--       TRIANGLES
-- Field          Type
-- A              Integer
-- B              Integer
-- C              Integer
-- Sample Output
-- Isosceles
-- Equilateral
-- Scalene
-- Not A Triangle
-- Explanation
-- Values in the tuple (20,20,23) form an Isosceles triangle, because A = B.
-- Values in the tuple (20,20,20) form an Equilateral triangle, because A = B = C.
-- Values in the tuple (20,21,22) form a Scalene triangle, because  A != B != C.
-- Values in the tuple (10,20,23) cannot form a triangle because the combined value
--  of sides A and B is not larger than that of side C.
SELECT CASE
WHEN A + B > C THEN
  CASE WHEN A = B AND B = C THEN 'Equilateral'
       WHEN A = B OR B = C OR A = C THEN 'Isosceles'
       WHEN A != B OR B != C OR A != C THEN 'Scalene'
  END
ELSE 'Not A Triangle' END
FROM TRIANGLES;
-- Equilateral
-- Equilateral
-- Isosceles
-- Equilateral
-- Isosceles
-- Equilateral
-- Scalene
-- Not A Triangle
-- Scalene
-- Scalene
-- Scalene
-- Not A Triangle
-- Not A Triangle
-- Scalene
-- Equilatera

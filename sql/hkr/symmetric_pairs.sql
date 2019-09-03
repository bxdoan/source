-- You are given a table, Functions, containing two columns: X and Y.
--       Functions
-- Field          Type
-- X             NUMBER
-- Y             NUMBER
-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
--
-- Write a query to output all such symmetric pairs in ascending order by the value of X.
-- Sample Output
--
-- 20 20
-- 20 21
-- 22 23
SELECT f1.X, f1.Y FROM Functions f1
INNER JOIN Functions f2 ON f1.X=f2.Y AND f1.Y=f2.X
GROUP BY f1.X, f1.Y
HAVING COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X
-- 2 24
-- 4 22
-- 5 21
-- 6 20
-- 8 18
-- 9 17
-- 11 15
-- 13 13

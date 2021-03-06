-- You are given three tables: Students, Friends and Packages. Students
-- contains two columns: ID and Name. Friends contains two columns: ID and
--  Friend_ID (ID of the ONLY best friend). Packages contains two columns:
--  ID and Salary (offered salary in $ thousands per month).
--
-- Sample Output
-- Samantha
-- Julia
-- Scarlet
--
-- Explanation
--
-- See the following table:
-- Now,
--
-- Samantha's best friend got offered a higher salary than her at 11.55
-- Julia's best friend got offered a higher salary than her at 12.12
-- Scarlet's best friend got offered a higher salary than her at 15.2
-- Ashley's best friend did NOT get offered a higher salary than her
-- The name output, when ordered by the salary offered to their friends, will be:
--
-- Samantha
-- Julia
-- Scarlet
Select S.Name
From ( Students S join Friends F Using(ID)
       join Packages P1 on S.ID=P1.ID
       join Packages P2 on F.Friend_ID=P2.ID)
Where P2.Salary > P1.Salary
Order By P2.Salary;
-- Stuart
-- Priyanka
-- Paige
-- Jane
-- Julia
-- Belvet
-- Amina
-- Kristeen
-- Scarlet
-- Priya
-- Meera

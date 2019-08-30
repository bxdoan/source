-- You are given two tables: Students and Grades. Students contains three columns
-- ID, Name and Marks.
-- Input Format
--       Students
-- Field          Type
-- ID             NUMBER
-- NAME           Varchar2(17)
-- MARKS          NUMBER
--       Grades
-- Field          Type
-- GRADE          NUMBER
-- MIN_MARK       NUMBER
-- MAX_MARK       NUMBER
-- Sample Output
--
-- Maria 10 99
-- Jane 9 81
-- Julia 9 88
-- Scarlet 8 78
-- NULL 7 63
-- NULL 7 68
--
-- Note
--
-- Print "NULL"  as the name if the grade is less than 8.
--
-- Explanation
--
-- Consider the following table with the grades assigned to the students:
-- So, the following students got 8, 9 or 10 grades:
--
-- Maria (grade 10)
-- Jane (grade 9)
-- Julia (grade 9)
-- Scarlet (grade 8)
select
case
  when grade < 8 then 'NULL'
  else s.name
end, g.grade, s.marks
from students s, grades g 
where s.marks between g.min_mark and g.max_mark
order by grade desc, s.name;

-- Britney 10 95
-- Heraldo 10 94
-- Julia 10 96
-- Kristeen 10 100
-- Stuart 10 99
-- Amina 9 89
-- Christene 9 88
-- Salma 9 81
-- Samantha 9 87
-- Scarlet 9 80
-- Vivek 9 84
-- Aamina 8 77
-- Belvet 8 78
-- Paige 8 74
-- Priya 8 76
-- Priyanka 8 77
-- NULL 7 64
-- NULL 7 66
-- NULL 6 55
-- NULL 4 34

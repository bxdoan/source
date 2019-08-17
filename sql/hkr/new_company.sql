-- Ambers conglomerate corporation just acquired some new companies. Each of
-- the companies follows this hierarchy:
-- founder -> lead manager -> senior manager -> manager -> employee
-- Given the table schemas below, write a query to print the company_code,
-- founder name, total number of lead managers, total number of senior managers,
-- total number of managers, and total number of employees. Order your output by
-- ascending company_code.
--
-- Note:
--
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric.
-- For example, if the company_codes are C_1, C_2, and C_10, then the ascending
-- company_codes will be C_1, C_10, and C_2.

-- Sample Output
--
-- C1 Monika 1 2 1 2
-- C2 Samantha 1 1 2 2
-- Explanation
--
-- In company C1, the only lead manager is LM1. There are two senior managers,
--  SM1 and SM2, under LM1. There is one manager, M1, under senior manager SM1.
--  There are two employees, E1 and E2, under manager M1.
--
-- In company C2, the only lead manager is LM2. There is one senior manager, SM3,
-- under LM2. There are two managers, M2 and M3, under senior manager SM3. There
-- is one employee, E3, under manager M2, and another employee, E4, under manager, M3.

select c.company_code, c.founder,
    count(distinct l.lead_manager_code), count(distinct s.senior_manager_code),
    count(distinct m.manager_code), count(distinct e.employee_code)
from Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e
where c.company_code = l.company_code
    and l.lead_manager_code=s.lead_manager_code
    and s.senior_manager_code=m.senior_manager_code
    and m.manager_code=e.manager_code
group by c.company_code, c.founder order by c.company_code;
-- C1 Angela 1 2 5 13 
-- C10 Earl 1 1 2 3
-- C100 Aaron 1 2 4 10
-- C11 Robert 1 1 1 1
-- C12 Amy 1 2 6 14
-- C13 Pamela 1 2 5 14
-- C14 Maria 1 1 3 5
-- C15 Joe 1 1 2 3
-- C16 Linda 1 1 3 5
-- C17 Melissa 1 2 3 7
-- C18 Carol 1 2 5 6
-- C19 Paula 1 2 4 7
-- C2 Frank 1 1 1 3
-- C20 Marilyn 1 1 2 2
-- C21 Jennifer 1 1 3 7
-- C22 Harry 1 1 3 6
-- C23 David 1 1 1 2
-- C24 Julia 1 1 2 6
-- C25 Kevin 1 1 2 5
-- C26 Paul 1 1 1 3

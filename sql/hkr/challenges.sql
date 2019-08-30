-- Julia asked her students to create some coding challenges. Write a query to
-- print the hacker_id, name, and the total number of challenges created by each
-- student. Sort your results by the total number of challenges in descending
--  order. If more than one student created the same number of challenges, then
--  sort the result by hacker_id. If more than one student created the same
--  number of challenges and the count is less than the maximum number of
--  challenges created, then exclude those students from the result.
--
-- Input Format
--
-- The following tables contain challenge data:
-- Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
--       Hackers
-- Field          Type
-- HACKER_ID      NUMBER
-- NAME           Varchar2(17)
-- Challenges: The challenge_id is the id of the challenge, and hacker_id is the
-- id of the student who created the challenge.
--       Challenges
-- Field            Type
-- challenge_id    NUMBER
-- hacker_id       NUMBER
-- Sample Output 0
--
-- 21283 Angela 6
-- 88255 Patrick 5
-- 96196 Lisa 1
/* these are the columns we want to output */
select c.hacker_id, h.name ,count(c.hacker_id) as c_count

/* this is the join we want to output them from */
from Hackers as h
    inner join Challenges as c on c.hacker_id = h.hacker_id

/* after they have been grouped by hacker */
group by c.hacker_id, h.name

/* but we want to be selective about which hackers we output */
/* having is required (instead of where) for filtering on groups */
having

    /* output anyone with a count that is equal to... */
    c_count =
        /* the max count that anyone has */
        (SELECT max(temp1.cnt)
        from (SELECT count(hacker_id) as cnt
             from Challenges
             group by hacker_id
             order by hacker_id) temp1)

    /* or anyone who's count is in... */
    or c_count in
        /* the set of counts... */
        (select t.cnt
         from (select count(*) as cnt
               from challenges
               group by hacker_id) t
         /* who's group of counts... */
         group by t.cnt
         /* has only one element */
         having count(t.cnt) = 1)

/* finally, the order the rows should be output */
order by c_count DESC, c.hacker_id

/* ;) */
;
-- 5120 Julia 50
-- 18425 Anna 50
-- 20023 Brian 50
-- 33625 Jason 50
-- 41805 Benjamin 50
-- 52462 Nicholas 50
-- 64036 Craig 50
-- 69471 Michelle 50
-- 77173 Mildred 50
-- 94278 Dennis 50
-- 96009 Russell 50
-- 96716 Emily 50
-- 72866 Eugene 42
-- 37068 Patrick 41
-- 12766 Jacqueline 40
-- 86280 Beverly 37
-- 19835 Joyce 36
-- 38316 Walter 35
-- 29483 Jeffrey 34
-- 23428 Arthur 33

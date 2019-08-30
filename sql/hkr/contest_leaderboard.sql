-- You did such a great job helping Julia with her last coding contest challenge
--  that she wants you to work on this one, too!
--
-- The total score of a hacker is the sum of their maximum scores for all of
-- the challenges. Write a query to print the hacker_id, name, and total score
-- of the hackers ordered by the descending score. If more than one hacker
--  achieved the same total score, then sort the result by ascending hacker_id.
--   Exclude all hackers with a total score of 0 from your result.
-- Input Format
--
-- The following tables contain challenge data:
-- Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
--       Hackers
-- Field          Type
-- HACKER_ID      NUMBER
-- NAME           Varchar2(17)
-- Submissions: The submission_id is the id of the submission, hacker_id is the id
--  of the hacker who made the submission, challenge_id is the id of the challenge
--  that the submission belongs to, and score is the score of the submission.
--       Submissions
-- Field            Type
-- submission_id    NUMBER
-- hacker_id        NUMBER
-- challenge_id     NUMBER
-- score            NUMBER
-- Sample Output
--
-- 4071 Rose 191
-- 74842 Lisa 174
-- 84072 Bonnie 100
-- 4806 Angela 89
-- 26071 Frank 85
-- 80305 Kimberly 67
-- 49438 Patrick 43
-- Explanation
--
-- Hacker 4071 submitted solutions for challenges 19797 and 49593, so the total
--  score = 95 + max (43,96) = 191.
--
-- Hacker 74842 submitted solutions for challenges 19797 and 63132, so the total
--  score  = max(98,5) + 76 = 174
--
-- Hacker 84072 submitted solutions for challenges 49593 and 63132, so the total
--  score  = 100 + 0 = 100.
--
-- The total scores for hackers 4806, 26071, 80305, and 49438 can be similarly calculated.
select h.hacker_id, name, sum(score) as total_score
from
hackers as h inner join
/* find max_score*/
(select hacker_id,  max(score) as score
from submissions
group by challenge_id, hacker_id) max_score

on h.hacker_id=max_score.hacker_id
group by h.hacker_id, name

/* don't accept hackers with total_score = 0 */
having total_score > 0

/* finally order as required */
order by total_score desc, h.hacker_id
;

-- 76971 Ashley 760
-- 84200 Susan 710
-- 76615 Ryan 700
-- 82382 Sara 640
-- 79034 Marilyn 580
-- 78552 Harry 570
-- 74064 Helen 540
-- 78688 Sean 540
-- 83832 Jason 540
-- 72796 Jose 510
-- 76216 Carlos 510
-- 90304 Lillian 500
-- 88507 Patrick 490
-- 72505 Keith 480
-- 88018 Dennis 480
-- 78918 Julia 470
-- 85319 Shawn 470
-- 71357 Bobby 460
-- 72047 Elizabeth 460
-- 74147 Jason 460

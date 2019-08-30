-- Julia just finished conducting a coding contest, and she needs your help
-- assembling the leaderboard! Write a query to print the respective hacker_id and
--  name of hackers who achieved full scores for more than one challenge. Order
--  your output in descending order by the total number of challenges in which the
--   hacker earned a full score. If more than one hacker received full scores in
--   same number of challenges, then sort them by ascending hacker_id.
-- Input Format
-- The following tables contain contest data:
-- Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
--       Hackers
-- Field          Type
-- HACKER_ID      NUMBER
-- NAME           Varchar2(17)
-- Difficulty: The difficult_level is the level of difficulty of the challenge,
-- and score is the score of the challenge for the difficulty level.
--       Difficulty
-- Field            Type
-- difficult_level  NUMBER
-- score            NUMBER
-- Challenges: The challenge_id is the id of the challenge, the hacker_id is the
-- id of the hacker who created the challenge, and difficulty_level is the level
-- of difficulty of the challenge.
--       Challenges
-- Field            Type
-- challenge_id     NUMBER
-- hacker_id        NUMBER
-- difficult_level  NUMBER
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
-- 90411 Joe
-- Explanation
--
-- Hacker 86870 got a score of 30 for challenge 71055 with a difficulty level of
-- 2, so 86870 earned a full score for this challenge.
--
-- Hacker 90411 got a score of 30 for challenge 71055 with a difficulty level of
-- 2, so 90411 earned a full score for this challenge.
--
-- Hacker 90411 got a score of 100 for challenge 66730 with a difficulty level of
--  6, so 90411 earned a full score for this challenge.
--
-- Only hacker 90411 managed to earn a full score for more than one challenge, so
--  we print the their hacker_id and name as space-separated values.
select h.hacker_id, h.name
from submissions s
inner join challenges c
on s.challenge_id = c.challenge_id
inner join difficulty d
on c.difficulty_level = d.difficulty_level
inner join hackers h
on s.hacker_id = h.hacker_id
where s.score = d.score and c.difficulty_level = d.difficulty_level
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, s.hacker_id asc
-- 27232 Phillip
-- 28614 Willie
-- 15719 Christina
-- 43892 Roy
-- 14246 David
-- 14372 Michelle
-- 18330 Lawrence
-- 26133 Jacqueline
-- 26253 John
-- 30128 Brandon
-- 35583 Norma
-- 13944 Victor
-- 17295 Elizabeth
-- 19076 Matthew
-- 26895 Evelyn
-- 32172 Jonathan
-- 41293 Robin
-- 45386 Christina
-- 45785 Jesse
-- 49652 Christine

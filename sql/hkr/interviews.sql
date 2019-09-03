-- Samantha interviews many candidates from different colleges using coding
--  challenges and contests. Write a query to print the contest_id, hacker_id,
--  name, and the sums of total_submissions, total_accepted_submissions, total_views,
--   and total_unique_views for each contest sorted by contest_id. Exclude the
--   contest from the result if all four sums are 0.
--
-- Note: A specific contest can be used to screen candidates at more than one
-- college, but each college only holds 1 screening contest.
--
-- Input Format
--
-- The following tables hold interview data:
--
-- Contests: The contest_id is the id of the contest, hacker_id is the id of the
--  hacker who created the contest, and name is the name of the hacker.
--       Contests
-- Field          Type
-- contest_id     NUMBER
-- hacker_id      NUMBER
-- name           STRING
-- Colleges: The college_id is the id of the college, and contest_id is the id
--  of the contest that Samantha used to screen the candidates.
--       Colleges
-- Field          Type
-- college_id     NUMBER
-- contest_id      NUMBER
-- Challenges: The challenge_id is the id of the challenge that belongs to one
-- of the contests whose contest_id Samantha forgot, and college_id is the id
-- of the college where the challenge was given to candidates.
--       Challenges
-- Field          Type
-- challenge_id   NUMBER
-- college_id     NUMBER
-- View_Stats: The challenge_id is the id of the challenge, total_views is the
-- number of times the challenge was viewed by candidates, and total_unique_views
-- is the number of times the challenge was viewed by unique candidates.
--       View_Stats
-- Field               Type
-- challenge_id        NUMBER
-- total_views         NUMBER
-- total_unique_views  NUMBER
-- Submission_Stats: The challenge_id is the id of the challenge, total_submissions
--  is the number of submissions for the challenge, and total_accepted_submission
--  is the number of submissions that achieved full scores.
--       Submission_Stats
-- Field                      Type
-- challenge_id               NUMBER
-- total_submissions          NUMBER
-- total_accepted_submission  NUMBER
-- Sample Output
--
-- 66406 17973 Rose 111 39 156 56
-- 66556 79153 Angela 0 0 11 10
-- 94828 80275 Frank 150 38 41 15
select con.contest_id,
       con.hacker_id,
       con.name,
       sum(total_submissions),
       sum(total_accepted_submissions),
       sum(total_views),
       sum(total_unique_views)
from contests con
join colleges col on con.contest_id = col.contest_id
join challenges cha on  col.college_id = cha.college_id
left join
(select challenge_id,
        sum(total_views) as total_views,
        sum(total_unique_views) as total_unique_views
        from view_stats
        group by challenge_id) vs on cha.challenge_id = vs.challenge_id
left join
(select challenge_id,
        sum(total_submissions) as total_submissions,
        sum(total_accepted_submissions) as total_accepted_submissions
        from submission_stats
        group by challenge_id) ss on cha.challenge_id = ss.challenge_id
group by con.contest_id, con.hacker_id, con.name
having sum(total_submissions)!=0 or
       sum(total_accepted_submissions)!=0 or
       sum(total_views)!=0 or
       sum(total_unique_views)!=0
order by contest_id;

-- 845 579 Rose 1987 580 1635 566
-- 858 1053 Angela 703 160 1002 384
-- 883 1055 Frank 1121 319 1217 338
-- 1793 2655 Patrick 1337 360 1216 412
-- 2374 2765 Lisa 2733 815 3368 904
-- 2963 2845 Kimberly 4306 1221 3603 1184
-- 3584 2873 Bonnie 2492 652 3019 954
-- 4044 3067 Michael 1323 449 1722 528
-- 4249 3116 Todd 1452 376 1767 463
-- 4269 3256 Joe 1018 372 1766 530
-- 4483 3386 Earl 1911 572 1644 477
-- 4541 3608 Robert 1886 516 1694 504
-- 4601 3868 Amy 1900 639 1738 548
-- 4710 4255 Pamela 2752 639 2378 705
-- 4982 5639 Maria 2705 759 2558 711
-- 5913 5669 Joe 2646 790 3181 835
-- 5994 5713 Linda 3369 967 3048 954
-- 6939 6550 Melissa 2842 859 3574 1004
-- 7266 6947 Carol 2758 665 3044 835
-- 7280 7030 Paula 1963 554 886 259

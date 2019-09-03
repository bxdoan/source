-- Julia conducted a 15 days of learning SQL contest. The start date of the
-- contest was March 01, 2016 and the end date was March 15, 2016.
--
-- Write a query to print total number of unique hackers who made at least 1
--  submission each day (starting on the first day of the contest), and find
--  the hacker_id and name of the hacker who made maximum number of submissions
--  each day. If more than one such hacker has a maximum number of submissions,
--  print the lowest hacker_id. The query should print this information for each
--  day of the contest, sorted by the date.
--
-- Input Format
--
-- The following tables hold contest data:
--
-- Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
--       Hackers
-- Field            Type
-- hacker_id        NUMBER
-- name             STRING
-- Submissions: The submission_date is the date of the submission, submission_id
-- is the id of the submission, hacker_id is the id of the hacker who made the
-- submission, and score is the score of the submission.
--       Submissions
-- Field               Type
-- submission_date     DATE
-- submission_id       NUMBER
-- hacker_id           NUMBER
-- score               NUMBER
with DAYSASLEVELS as
	(
	select Submission_date,
		count(distinct Hacker_id) as NumHackers
	 from SUBMISSIONS
	 group by Submission_date
	 start with Submission_date='2016-03-01'
	 connect by
		 prior to_date(Submission_date,'yyyy-mm-dd')
			 = to_date(Submission_date,'yyyy-mm-dd')-1
		and        prior Hacker_id=Hacker_id
		and to_date(Submission_date,'yyyy-mm-dd')
			 <= to_date('2016-03-15','yyyy-mm-dd')
	),
/* returns: Submission_date, Hacker_id, numberOfHacks */
/*           for each hacker on each day */
	MULTIHACKERS as
	(
	select Submission_date,
		Hacker_id,
		count(Submission_id) as NumHacks
	 from SUBMISSIONS
	 where to_date(Submission_date,'yyyy-mm-dd')
		between to_date('2016-03-01','yyyy-mm-dd')
		 and to_date('2016-03-15','yyyy-mm-dd')
	 group by Submission_date, Hacker_id
	 having count(Submission_id)>0
	),
/* returns: Submission_date, maxNumberOfHacks  on that day   */
	MOSTHACKS as
	(
	select Submission_date as Subdate,
		max(NumHacks) as MaxHacks
	 from MULTIHACKERS
	 group by Submission_date
	),
/* returns: date, numHackersWithSubEveryDaySoFar,  */
/*          smallestHackerIdWithMaxhacks           */
	SOLNBYID as
	(
	select MH1.Submission_date as Sdate,
		NumHackers,
		min(MH2.Hacker_id) as WinnerId
	 from MULTIHACKERS MH1
	  inner join MULTIHACKERS MH2
		on MH1.Submission_date=MH2.Submission_date
	  inner join MOSTHACKS
		on MH2.NumHacks=maxHacks
		 and MH2.Submission_date=MOSTHACKS.Subdate
	  inner join DAYSASLEVELS
		on MH1.Submission_date=DAYSASLEVELS.Submission_date
	 group by MH1.Submission_date, NumHackers
	)
/*  tack on the Name of the winning Hacker_id */
 select Sdate, NumHackers, H.Hacker_id, H.Name
  from (SOLNBYID inner join HACKERS H on H.Hacker_id=WinnerId)
  order by to_date(Sdate,'yyyy-mm-dd');

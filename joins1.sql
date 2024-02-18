/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.
*/
select h.hacker_id, h.name, sum(h.max_score) as total_score from

(select a.hacker_id, a.challenge_id, b.name, max(a.score) as max_score 
from Submissions a left join Hackers b on (a.hacker_id = b.hacker_id) group by a.challenge_id, a.hacker_id, b.name) h  

group by h.hacker_id, h.name having total_score != 0 
order by total_score desc, h.hacker_id asc

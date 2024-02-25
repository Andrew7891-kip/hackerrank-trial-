/*
Julia asked her students to create some coding challenges.
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, 
then exclude those students from the result.
*/
SELECT Hackers.hacker_id,name,COUNT(challenge_id) FROM Hackers
INNER JOIN Challenges
ON Hackers.hacker_id = Challenges.hacker_id
GROUP BY Hackers.hacker_id,name
HAVING COUNT(challenge_id) IN (
SELECT challenge_count FROM 
(SELECT hacker_id, COUNT(challenge_id) AS challenge_count FROM Challenges AS Count_sheet
GROUP BY hacker_id) AS Distinct_sheet
GROUP BY challenge_count
HAVING COUNT(challenge_count)=1)
OR COUNT(challenge_id) IN (
SELECT MAX(challenge_count) FROM 
(SELECT hacker_id, COUNT(challenge_id) AS challenge_count FROM Challenges AS Count_sheet
GROUP BY hacker_id) AS Distinct_sheet)
ORDER BY COUNT(challenge_id) DESC,Hackers.hacker_id 

/*Pivot the Occupation column in OCCUPATIONS so that each Name is sorted
alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.*/

SELECT 
MAX(CASE WHEN occupation = 'Doctor' THEN name END) as Doctor,
MAX(CASE WHEN occupation = 'Professor' THEN name END) as Professor,
MAX(CASE WHEN occupation = 'Singer' THEN name END) as Singer,
MAX(CASE WHEN occupation = 'Actor' THEN name END) as Actor
FROM
(SELECT name, occupation, ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) as row_num FROM occupations) as Temp
GROUP BY row_num;

/**/

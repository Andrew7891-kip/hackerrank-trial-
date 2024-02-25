/*Write a query to print all prime numbers less than or equal to 1000 . 
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
*/
WITH RECURSIVE num_list AS (
  SELECT 2 AS num
  UNION
  SELECT num + 1
  FROM num_list
  WHERE num < 1000
),

prime AS (
  SELECT 
    nl1.num AS n1, 
    nl2.num AS n2,
    SUM(1) OVER (PARTITION BY nl1.num) AS c
  FROM num_list nl1
  CROSS JOIN num_list nl2
  WHERE nl1.num % nl2.num = 0
)

SELECT GROUP_CONCAT(n1 ORDER BY n1 ASC SEPARATOR '&')
FROM prime
WHERE c = 1;

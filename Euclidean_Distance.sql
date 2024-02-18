/*
Consider p1(a,c) and p2(b,d) to be two points on a 2D plane 
where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and 
(c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.
NOTE: Euclidean_Distance = {\displaystyle d(p,q)={\sqrt {(p_{1}-q_{1})^{2}+(p_{2}-q_{2})^{2}}}.}
*/

SELECT ROUND((SQRT(POWER((MAX(LAT_N)-MIN(LAT_N)), 2) + POWER((MAX(LONG_W)-MIN(LONG_W)), 2))), 4)
FROM STATION

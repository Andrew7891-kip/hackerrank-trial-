/*
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
*/
SELECT ROUND(LAT_N ,4) AS Median_LAT_N
FROM(
SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowNumber FROM STATION
)AS RankedData
WHERE RowNumber IN (
    (SELECT ROUND(COUNT(*)/2) FROM STATION)
    );

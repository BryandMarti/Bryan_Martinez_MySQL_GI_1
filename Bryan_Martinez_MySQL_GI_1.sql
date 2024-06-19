-- 1. Select all data from the dataset.
SELECT * from GI1 . sunshine3;

--  2. City names that had exactly 314 hours of sunshine in June.

SELECT City
FROM GI1 . sunshine3
WHERE Jun = 314;

-- 3. Country and City names that had exactly 314 hours of sunshine in June.

SELECT Country , City
FROM GI1 . sunshine3
WHERE Jun = 314;

-- 4. A list of all countries in the dataset.

SELECT Country
FROM GI1 . sunshine3;

-- 5. All information in the table for cities starting with “Ch”

SELECT City
FROM GI1 . sunshine3
WHERE City LIKE ('Ch%');


-- 6. Cities that received a total amount of sunshine greater than 3,000 hours.

SELECT City
FROM GI1 . sunshine3
WHERE Year > 3000;

-- 7. Cities that received a total amount of sunshine greater than 3,000 hours that are also in the United States.

SELECT City
FROM GI1 . sunshine3
WHERE Country = 'United States'
AND Year > 3000;

-- 8. All information in the dataset where Country has no null values.

SELECT *
FROM GI1 . sunshine3
WHERE Country IS NOT NULL;

-- 9. Select all data for Charlotte, Raleigh, and Atlanta.

SELECT *
FROM GI1 . sunshine3
WHERE City IN ('Charlotte', 'Raleigh', 'Atlanta');

-- 10. The city and country for each location that receives between 5 and 20 hours of sunshine in January.

SELECT Country , City , Jan
FROM GI1 . sunshine3
WHERE Jan >= 5
AND Jan <= 20;

-- 11. The city and country for each location that receives between 5 and 20 hours of sunshine in January and over 300 hours of sunshine in June.

SELECT Country , City , Jan , Jun
FROM GI1 . sunshine3
WHERE Jan >= 5 AND Jan <= 20
AND Jun >= 300;

-- 12. All cities in the dataset that are in the United States excluding Charlotte.

SELECT City
FROM GI1 . sunshine3
WHERE  City NOT IN ('Charlotte');

-- 13. All cities in the dataset that are in the United States excluding Charlotte, Boston, and Las Vegas.


SELECT City
FROM GI1 . sunshine3
WHERE  City NOT IN ('Charlotte', 'Boston', 'Las Vegas');

-- 14. All information in the dataset for cities that have exactly 225 hours of sunshine in September or have at least 200 hours of sunshine in January.

SELECT *
FROM GI1 . sunshine3
WHERE Sep = 225 OR Jan >= 200;

-- 15. All information in the dataset for cities in the United States that have exactly 225 hours of sunshine in September or have at least 200 hours of sunshine in January.

SELECT *
FROM GI1 . sunshine3
WHERE Country = 'United States'
AND (Sep = 225 OR Jan >= 200);

-- 16. How many rows are in the data set?

SELECT COUNT(*)
FROM GI1 . sunshine3;

-- 17. What is the total hours of sunshine for cities in the United States in May?

SELECT City , SUM(May) AS TotalSunHourMay
FROM GI1 . sunshine3
WHERE Country = 'United States'
GROUP BY City;

-- 18. Find the city that is last in alphabetical order. 

SELECT City
FROM GI1.sunshine3
ORDER BY City DESC
LIMIT 1;

-- 19. What is the average hours of sunshine in January?

SELECT AVG(Jan) AS JanAverage
FROM GI1 . sunshine3;

-- 20. Which is higher, the average hours of sunshine in July for the United States or Australia? Find this in one query.

SELECT Country , AVG(Jul) AS AvgJulSunshine
FROM GI1 . sunshine3
WHERE Country IN ('United States', 'Australia')
GROUP BY Country
ORDER BY AvgJulSunshine DESC
LIMIT 1;

-- 21. Count the countries in this dataset using a COUNT and COUNT DISTINCT. Interpret your results.

SELECT COUNT(*) AS Country_Count
FROM GI1 . sunshine3;
-- I found out that the query DISTINCT is more to find the numbers of unique countries in the Dataset
SELECT COUNT(DISTINCT Country) AS UniqueCountries
FROM GI1.sunshine3;

-- 22. Return the top 10 countries with the highest average sunshine for the year (use the ‘Year’ column)

SELECT Country , AVG(Year) AS AvgYearSunshine
FROM GI1 . sunshine3
GROUP BY Country
ORDER BY AvgYearSunshine DESC
LIMIT 10;


-- 23. Return the countries where we only have information about one city.

SELECT Country
FROM GI1.sunshine3
WHERE City IS NOT NULL
GROUP BY Country
-- the HAVING clause to ensure that only those countries with exactly 1 city are displayed
HAVING COUNT(*) = 1;













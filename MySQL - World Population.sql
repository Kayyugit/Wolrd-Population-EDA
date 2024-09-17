-- Top 10 Most Populated Countries (2022)
-- This is to check the most populated country with the latest date available in the data.
-- If you have more recent numbers, modify to match the new data
SELECT Country_Territory, Population_2022
FROM world_population
ORDER BY Population_2022 DESC
LIMIT 10;

-- Continent-wise Population in 2022
SELECT Continent, SUM(Population_2022) AS Total_Population_2022
FROM world_population
GROUP BY Continent
ORDER BY Total_Population_2022 DESC;

-- Growth Rate Comparison Between 2022 and 2000
SELECT Country_Territory, 
       (Population_2022 - Population_2000) / Population_2000 * 100 AS Growth_Rate_Percentage
FROM world_population
WHERE Population_2000 > 0
ORDER BY Growth_Rate_Percentage DESC;

-- Countries with the Highest Population Density in 2022
SELECT Country_Territory, Density_per_km2
FROM world_population
ORDER BY Density_per_km2 DESC
LIMIT 10;

-- Countries with Population Decline
SELECT Country_Territory, Population_2000, Population_2022
FROM world_population
WHERE Population_2022 < Population_2000
ORDER BY (Population_2000 - Population_2022) DESC;

-- Total Area by Continent
SELECT Continent, SUM(Area_km2) AS Total_Area_km2
FROM world_population
GROUP BY Continent
ORDER BY Total_Area_km2 DESC;

-- Countries with the Highest Growth Rate in 2022
SELECT Country_Territory, Growth_Rate
FROM world_population
ORDER BY Growth_Rate DESC
LIMIT 10;

-- World Population Percentage by Country
SELECT Country_Territory, World_Population_Percentage
FROM world_population
ORDER BY World_Population_Percentage DESC
LIMIT 10;

-- Comparison of Population in 2022 and 2010
SELECT Country_Territory, Population_2010, Population_2022, 
       (Population_2022 - Population_2010) AS Population_Change
FROM world_population
ORDER BY Population_Change DESC
LIMIT 10;

-- Average Population Density by Continent
SELECT Continent, AVG(Density_per_km2) AS Avg_Density_per_km2
FROM world_population
GROUP BY Continent
ORDER BY Avg_Density_per_km2 DESC;

-- Top 10 Countries by Population Growth from 2000 to 2022
SELECT 
    Country_Territory,
    Population_2000,
    Population_2022,
    (Population_2022 - Population_2000) AS Absolute_Growth
FROM
    world_population
ORDER BY Absolute_Growth DESC
LIMIT 10;

-- Countries with Population Growth Stagnation (Less than 1% Growth) from 2000 to 2022
SELECT Country_Territory, Population_2000, Population_2022, 
       (Population_2022 - Population_2000) / Population_2000 * 100 AS Growth_Rate_Percentage
FROM world_population
WHERE (Population_2022 - Population_2000) / Population_2000 * 100 < 1
ORDER BY Growth_Rate_Percentage ASC;

-- Countries with the Lowest Population Density
SELECT Country_Territory, Density_per_km2
FROM world_population
ORDER BY Density_per_km2 ASC
LIMIT 10;

-- Countries with the Largest Land Area
SELECT Country_Territory, Area_km2
FROM world_population
ORDER BY Area_km2 DESC
LIMIT 10;

-- Continents with the Highest Average Growth Rate
SELECT Continent, AVG(Growth_Rate) AS Avg_Growth_Rate
FROM world_population
GROUP BY Continent
ORDER BY Avg_Growth_Rate DESC;

-- Countries with Population Growth Turnaround
-- This is to identify countries where the population decreased between 2000 and 2010 but increased from 2010 to 2022
SELECT Country_Territory, Population_2000, Population_2010, Population_2022
FROM world_population
WHERE Population_2010 < Population_2000 AND Population_2022 > Population_2010
ORDER BY (Population_2022 - Population_2010) DESC;

-- Smallest Countries by Population in 2022
SELECT Country_Territory, Population_2022
FROM world_population
ORDER BY Population_2022 ASC
LIMIT 10;

-- Continents with the Most Countries Represented
SELECT Continent, COUNT(*) AS Number_of_Countries
FROM world_population
GROUP BY Continent
ORDER BY Number_of_Countries DESC;

-- Countries with the Highest Density to Area Ratio
SELECT Country_Territory, Density_per_km2 / Area_km2 AS Density_Area_Ratio
FROM world_population
ORDER BY Density_Area_Ratio DESC
LIMIT 10;

-- Countries with the Largest Decline in Population (2000-2022)
SELECT Country_Territory, Population_2000, Population_2022, 
       (Population_2000 - Population_2022) AS Population_Decline
FROM world_population
WHERE Population_2022 < Population_2000
ORDER BY Population_Decline DESC
LIMIT 10;

-- Population Density Change from 2000 to 2022
SELECT Country_Territory, 
       Population_2022 / Area_km2 AS Density_2022,
       Population_2000 / Area_km2 AS Density_2000,
       (Population_2022 / Area_km2) - (Population_2000 / Area_km2) AS Density_Change
FROM world_population
ORDER BY Density_Change DESC;

--  Countries with the Fastest Decline in Growth Rate
SELECT Country_Territory, Growth_Rate, 
       (Population_2022 - Population_2000) / Population_2000 * 100 AS Growth_Rate_2000_2022,
       Growth_Rate - ((Population_2022 - Population_2000) / Population_2000 * 100) AS Growth_Rate_Decline
FROM world_population
ORDER BY Growth_Rate_Decline ASC
LIMIT 10;

-- Countries with Consistent Population Growth Across Decades
SELECT Country_Territory, 
       Population_1970, Population_1980, Population_1990, 
       Population_2000, Population_2010, Population_2015, 
       Population_2020, Population_2022
FROM world_population
WHERE Population_1980 > Population_1970
  AND Population_1990 > Population_1980
  AND Population_2000 > Population_1990
  AND Population_2010 > Population_2000
  AND Population_2015 > Population_2010
  AND Population_2020 > Population_2015
  AND Population_2022 > Population_2020;

-- Countries with Population Peaks in 2022
-- This is to identify countries where the population in 2022 is the highest ever recorded in the dataset
SELECT Country_Territory, Population_2022
FROM world_population
WHERE Population_2022 = GREATEST(Population_1970, Population_1980, Population_1990, 
                                 Population_2000, Population_2010, Population_2015, 
                                 Population_2020, Population_2022)
ORDER BY Population_2022 DESC;

-- Countries with the Largest Area but Low Population Density
SELECT Country_Territory, Area_km2, Density_per_km2
FROM world_population
WHERE Area_km2 > 1000000  -- Large area threshold (1 million km²)
ORDER BY Density_per_km2 ASC
LIMIT 10;

-- Most Urbanized Countries (High Density and Small Area)
SELECT Country_Territory, Area_km2, Density_per_km2
FROM world_population
WHERE Area_km2 < 50000  -- Small area threshold (50,000 km²)
ORDER BY Density_per_km2 DESC
LIMIT 10;

--  Continents with the Most Countries with High Growth Rates
SELECT Continent, COUNT(*) AS High_Growth_Countries
FROM world_population
WHERE Growth_Rate > 1
GROUP BY Continent
ORDER BY High_Growth_Countries DESC;

-- Countries with Stable Population (Little Change from 2000 to 2022)
SELECT Country_Territory, Population_2000, Population_2022, 
       ABS(Population_2022 - Population_2000) / Population_2000 * 100 AS Stability_Percentage
FROM world_population
HAVING Stability_Percentage < 5
ORDER BY Stability_Percentage ASC;

-- Most Populous Countries by Continent in 2022
SELECT Continent, Country_Territory, Population_2022
FROM (
    SELECT Continent, Country_Territory, Population_2022,
           ROW_NUMBER() OVER (PARTITION BY Continent ORDER BY Population_2022 DESC) AS ranks
    FROM world_population
) AS ranked
WHERE ranks <= 10
ORDER BY Continent, Population_2022 DESC;

-- Countries with the Highest Proportion of Global Population in 2022
SELECT Country_Territory, World_Population_Percentage
FROM world_population
ORDER BY World_Population_Percentage DESC
LIMIT 10;

-- Identify countries that have experienced the highest yearly growth rate from 2020 to 2022
SELECT Country_Territory, 
       (Population_2022 - Population_2020) / Population_2020 * 100 AS Yearly_Growth_Rate
FROM world_population
ORDER BY Yearly_Growth_Rate DESC
LIMIT 10;


create database world_population;

CREATE TABLE world_population (
    Ranks INT,
    CCA3 VARCHAR(3),
    Country_Territory VARCHAR(100),
    Capital VARCHAR(100),
    Continent VARCHAR(50),
    Population_2022 BIGINT,
    Population_2020 BIGINT,
    Population_2015 BIGINT,
    Population_2010 BIGINT,
    Population_2000 BIGINT,
    Population_1990 BIGINT,
    Population_1980 BIGINT,
    Population_1970 BIGINT,
    Area_km2 INT,
    Density_per_km2 FLOAT,
    Growth_Rate FLOAT,
    World_Population_Percentage FLOAT
);

select count(*) from world_population;
-- checking if all data was imported
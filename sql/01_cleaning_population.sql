CREATE OR REPLACE TABLE `revou-sql-class-492012.barcelona.population_clean` AS
WITH median_population AS (
  SELECT
    Year, Neighborhood_Code, Neighborhood_Name,
    District_Code, District_Name, Gender, Age,
    PERCENTILE_CONT(Number, 0.5) OVER
    (PARTITION BY Year, Neighborhood_Code, Gender, Age) AS median_number
  FROM `revou-sql-class-492012.barcelona.population`
)
SELECT DISTINCT
  Year, Neighborhood_Code, Neighborhood_Name,
  District_Code, District_Name, Gender, Age, median_number
FROM median_population

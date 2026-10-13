CREATE OR REPLACE TABLE `revou-sql-class-492012.barcelona.district_analysis` AS
  
WITH NO2_by_district_name AS(
  SELECT
  air_stations_Nov2017.`District Name`,
  AVG(CAST(air_quality_Nov2017_clean.NO2_Value as FLOAT64)) AS AVG_NO2_Value
FROM `revou-sql-class-492012.barcelona.air_stations_Nov2017` AS air_stations_Nov2017
LEFT JOIN `revou-sql-class-492012.barcelona.air_quality_Nov2017_clean` AS air_quality_Nov2017_clean
ON air_stations_Nov2017.Station = air_quality_Nov2017_clean.Station
GROUP BY 1),

life_expectancy_by_district_name AS(
  SELECT 
  population_clean.District_Name,
  ROUND(AVG (life_expectancy_clean.`2006-2010`), 2) AS AVG_2006_2010,
  ROUND(AVG (life_expectancy_clean.`2007-2011`), 2) AS AVG_2007_2011,
  ROUND(AVG (life_expectancy_clean.`2008-2012`), 2) AS AVG_2008_2012,
  ROUND(AVG (life_expectancy_clean.`2009-2013`), 2) AS AVG_2009_2013,
  ROUND(AVG (life_expectancy_clean.`2010-2014`), 2) AS AVG_2010_2014
FROM `revou-sql-class-492012.barcelona.life_expectancy_clean` AS life_expectancy_clean
LEFT JOIN `revou-sql-class-492012.barcelona.population_clean` AS population_clean
ON life_expectancy_clean.Neighborhood = population_clean.Neighborhood_Name
GROUP BY 1)
SELECT
  NO2_by_district_name.`District Name`,
  NO2_by_district_name.AVG_NO2_Value,
  life_expectancy_by_district_name.AVG_2006_2010,
  life_expectancy_by_district_name.AVG_2007_2011,
  life_expectancy_by_district_name.AVG_2008_2012,
  life_expectancy_by_district_name.AVG_2009_2013,
  life_expectancy_by_district_name.AVG_2010_2014
FROM NO2_by_district_name
LEFT JOIN life_expectancy_by_district_name
ON REPLACE(REPLACE(REPLACE(REPLACE(
  NO2_by_district_name.`District Name`,
  'Gracia', 'Gràcia'),
  'Guinardo', 'Guinardó'),
  'Marti', 'Martí'),
  'Montjuic', 'Montjuïc')
= life_expectancy_by_district_name.District_Name

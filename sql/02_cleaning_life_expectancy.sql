CREATE OR REPLACE TABLE `revou-sql-class-492012.barcelona.life_expectancy_clean` AS
  SELECT
    TRIM(REPLACE(REPLACE(Neighborhood, ' - Zona Franca',''), ' - Parc Montjuïc','')) AS Neighborhood,
  `2006-2010`,
  `2007-2011`,
  `2008-2012`,
  `2009-2013`,
  `2010-2014`,
  Gender
 FROM `revou-sql-class-492012.barcelona.life_expectancy`

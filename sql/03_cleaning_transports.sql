CREATE OR REPLACE TABLE revou-sql-class-492012.barcelona.transports_clean AS
SELECT
  `Code`,
  `Transport`,
  `Longitude`,
  `Latitude`,
  `Station`,
  `District_Name`,
  `Neighborhood_Name`
FROM revou-sql-class-492012.barcelona.transports
WHERE District_Name != ''

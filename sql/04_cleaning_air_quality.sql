CREATE OR REPLACE TABLE revou-sql-class-492012.barcelona.air_quality_Nov2017_clean AS
SELECT
  `Station`,
  NULLIF (`Air Quality`, '--') AS Air_Quality,
  `Longitude`,
  `Latitude`,
  NULLIF (`O3 Hour`, 'NA') AS O3_Hour,
  NULLIF (`O3 Quality`, 'NA') AS O3_Quality,
  NULLIF (`O3 Value`, 'NA') AS O3_Value,
  NULLIF (`NO2 Hour`, 'NA') AS NO2_Hour,
  NULLIF (`NO2 Quality`, 'NA') AS NO2_Quality,
  NULLIF (`NO2 Value`, 'NA') AS NO2_Value,
  NULLIF (`PM10 Hour`, 'NA') AS PM10_Hour,
  NULLIF (`PM10 Quality`, 'NA') AS PM10_Quality,
  NULLIF (`PM10 Value`,'NA') AS PM10_Value,
  `Generated`,
  `Date Time`
FROM revou-sql-class-492012.barcelona.air_quality_Nov2017

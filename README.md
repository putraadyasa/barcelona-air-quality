# Barcelona Air Quality & Life Expectancy Analysis

## Business Question
Which district in Barcelona has the worst air quality, and does it also have lower life expectancy?

## Tools Used
- **SQL** — Google BigQuery (data cleaning & analysis)
- **Python** — Google Colab (visualization & statistical analysis)
- **Libraries:** pandas, matplotlib, numpy, scipy

## Dataset
Barcelona Open Data — November 2017
- `air_quality_Nov2017` — hourly air quality readings per station
- `air_stations_Nov2017` — station metadata (location, district)
- `population` — population by neighborhood
- `life_expectancy` — life expectancy by neighborhood (2006–2014)

## Pollutants Analyzed
| Pollutant | Districts Covered | Key Decision |
|---|---|---|
| NO2 | 8 districts | Primary metric — most complete data (5% missing) |
| O3 | 5 districts | 3 stations excluded — no equipment or no data |
| PM10 | 5 districts | 3 stations excluded + 1 station added via external source |

## Key Findings
- **Eixample** has the worst air quality by NO2 (56.2 µg/m³)
- **Ciutat Vella** has the lowest life expectancy (81.14 years) with 2nd highest NO2
- Pearson correlation results: NO2 (−0.232), O3 (+0.223), PM10 (−0.171) — none statistically significant (p > 0.05)

## Data Limitations
- Only 5–8 districts per pollutant — too few for reliable statistical inference
- One month of air quality data (November 2017 only)
- Life expectancy is multi-causal — income, healthcare, housing not controlled for

## Repository Structure
```
barcelona-air-quality/
├── README.md
├── sql/
│   ├── 01_cleaning_population.sql
│   ├── 02_cleaning_life_expectancy.sql
│   ├── 03_cleaning_transports.sql
│   ├── 04_analysis_NO2.sql
│   ├── 05_analysis_O3.sql
│   └── 06_analysis_PM10.sql
├── notebooks/
│   └── barcelona_analysis.ipynb
└── data/
    ├── district_analysis.csv
    ├── district_analysis_O3.csv
    └── district_analysis_PM10.csv
```

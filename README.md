### UCI-Bootcamp-Project-2-ETL

## Intro

Our team aimed to create a database which includes country information on suicide rate and world development indicators: GDP, internet usage, and urbanization.

  

Potential usage for this database would be to explore the relationship between suicide rates and the country’s development. Could a population’s access to social networks (whether in real life in a densely populated urban area, or online using social media) affect the suicide rates in that country? And can money (i.e. GDP per capita) really buy happiness?

  

Data sources:

[https://www.kaggle.com/worldbank/world-development-indicators/data#](https://www.kaggle.com/worldbank/world-development-indicators/data#) (Database.sqlite)

[https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016](https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016) (master.csv)

## Extraction

**Database.Sqlite extraction**

 - SQLalchemy

		After importing the necessary packages and loading the SQL database, we must probe the 1.3 gb data for desired indicators.

 - Inspector

		After inspection, we find indicators is the table which contains our desired values. Using sqlite viewer, we find that GDP, urbanization, and internet availability.

- Query

		Because there is no primary key, conventional automapping classes by SQLalchemy does not work. Instead we will use native SQL query to extract the database columns.

  

**Master.csv extraction**

 - Import pandas as pd
   
  - pd.read_csv

## Transformation

**Database.Sqlite**

 - Pandas Dataframe

		Using the query, we transform the SQL data to dataframe form and then rename the columns and set index to countries for ease of merging.

 - Pandas Merging

		Using pandas merge, we merge the tables of each query and export to csv to put into SQL database.

  

**Master.csv**

- Pandas Dataframe

- Suicide Rates by Country Dataframe

- Group by year and country with sum of suicide rates as values, then unstack

- For loop to grab last reported suicide rate for each country

- Create a dictionary to store country as key, and corresponding suicide rate as value

- Convert to dataframe with country as index, and export as csv

- GDP by Country Dataframe

- Pull necessary columns from original database (country, year, GDP per capita)

- Drop duplicate rows

- Group by country and year, with GDP per capita as values displayed, then unstack

- For loop to grab last reported GDP per capita for each country

-  Create a dictionary to store country as key, and corresponding GDP per capita as value

- Convert to dataframe with country as index, and export as csv

## Loading

 - PGAdmin (PostgreSQL)
   
 - Create table for each csv created
   
  - Import csvs into tables
   
   - Query each table to ensure properly imported
   
   - Inner join tables on “country”

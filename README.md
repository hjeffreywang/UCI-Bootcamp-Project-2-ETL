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

	The first steps are importing the necessary packages, loading the SQL database, and probing the 1.3 gb data for desired indicators.

 - Inspector

	Indicators is the table which contains our desired values. Using sqlite viewer, we find that GDP, urbanization, and internet availability are indicators which could most likely affect suicide rate.
	

- Deciding indicators 

	Due to the overwhelming evidence that the introduction of the internet has created an increasingly socially isolated society, percentge of internet availability is measured. Since GDP is most accepted measure of wealth, that is another indicator we will query. Finally, increased urbanization and increased population density may be a factor that affects suicidal rates, and thus we also queried this.

- Query

	Because there is no primary key, conventional automapping classes by SQLalchemy does not work. Instead we use native SQL query to extract the database columns.

  

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

#### Suicide Rates by Country Dataframe

Using Pandas, group the data by `year` and `country` with sum of `suicide rates per 100k pop` as values, then unstack to view the `year` as the index and `country` as column titles. To grab the last reported suicide rate for each country, we iterate through the rows using a for loop. Create a dictionary to store the country as a key, and corresponding suicide rate as value; then convert the dictionary to a Pandas dataframe with country as index, and export as a .csv file.

#### GDP by Country Dataframe

Create a new Pandas dataframe with only the necessary columns from original the orignal data (`country`, `year`, `GDP per capita`). Drop duplicate rows, then group by `country` and `year`, with `GDP per capita` as the values displayed, then unstack to view the `year` as the index and `country` as column titles. To grab the last reported GDP per capita for each country, we iterate through the rows using a for loop. Create a dictionary to store country as key, and corresponding GDP per capita as value; then convert the dictionary to a dataframe with country as index, and export as .csv file.

## Loading

PGAdmin (PostgreSQL) is chosen for ease of query and initialization. Table for each .csv file were created, then .csv files were imported into the table. Then, we query each table to ensure the dat was properly imported. To create the final database, we inner join tables on `country`.

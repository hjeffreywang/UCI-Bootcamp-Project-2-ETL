DROP TABLE suicide_rates;

CREATE TABLE suicide_rates(
country VARCHAR PRIMARY KEY,
suicides_per_100k_pop DECIMAL NOT NULL);

CREATE TABLE gdp(
country VARCHAR PRIMARY KEY,
gdp_per_capita_USD DECIMAL NOT NULL);

CREATE TABLE internet_urban(
country VARCHAR PRIMARY KEY,
internet_users_per_100_people DECIMAL NOT NULL,
percentage_of_urban_pop DECIMAL NOT NULL);
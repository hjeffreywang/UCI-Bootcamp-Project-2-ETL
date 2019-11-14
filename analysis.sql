SELECT * FROM suicide_rates;

SELECT * FROM gdp;

SELECT * FROM internet_urban;

SELECT 
SR.country,
SR.suicides_per_100k_pop AS "Suicides_per_100K_People",
gdp.gdp_per_capita_usd AS "GDP_per_Capita_in_USD",
internet_urban.internet_users_per_100_people,
internet_urban.percentage_of_urban_pop
FROM
suicide_rates AS SR
JOIN gdp ON gdp.country = SR.country
JOIN internet_urban ON internet_urban.country = SR.country
ORDER BY country DESC;


1, Show the possible values of the year column in the country_stats table sorted by most recent year first.
select distinct year from country_stats order by year desc;
2, Show the names of the first 5 countries in the database when sorted in alphabetical order by name.
select name from countries order by name limit 5;
3, Adjust the previous query to show both the country name and the gdp from 2018, but this time show the top 5 countries by gdp.
select c.name, cs.gdp
from countries c
inner join country_stats cs on c.country_id = cs.country_id
where cs.year = 2018
order by cs.gdp desc
limit 5;
4, How many countries are associated with each region id?
select region_id, count(*) as country_count
from countries
group by region_id
order by country_count desc;
5, What is the average area of countries in each region id?
select regions.region_id, round(avg(countries.area)) as avg_area
from regions
join countries on regions.region_id = countries.region_id
group by regions.region_id
order by avg_area;
6, Use the same query as above, but only show the groups with an average country area less than 1000
select regions.region_id, round(avg(countries.area)) as avg_area
from regions
join countries on regions.region_id = countries.region_id
group by regions.region_id
having round(avg(countries.area)) < 1000
order by avg_area;
7, Create a report displaying the name and population of every continent in the database from the year 2018 in millions.
select c.name, round(sum(cs.population)/1000000.0, 2) as tot_pop
from continents c
join regions r on c.continent_id = r.continent_id
join countries co on r.region_id = co.region_id
join country_stats cs on co.country_id = cs.country_id
where cs.year = 2018
group by c.name
order by tot_pop desc;
8, List the names of all of the countries that do not have a language.
select name 
from countries 
where country_id not in (select country_id from country_languages);
9, Show the country name and number of associated languages of the top 10 countries with most languages
select c.name as country_name, count(cl.language_id) as lang_count
from countries c
join country_languages cl on c.country_id = cl.country_id
group by c.country_id
order by lang_count desc
limit 10;
10,Repeat your previous query, but display a comma separated list of spoken languages rather than a count (use the aggregate function for strings, string_agg. A single example row (note that results before and above have been omitted for formatting):
select countries.name as country_name, string_agg(languages.language, ', ') as spoken_languages
from countries
join country_languages on countries.country_id = country_languages.country_id
join languages on country_languages.language_id = languages.language_id
group by countries.country_id
order by count(*) desc
limit 10;
11, What is the average number of languages in every country in a region in the dataset? Show both the region's name and the average. Make sure to include countries that don't have a language in your calculations. (Hint: using your previous queries and additional subqueries may be useful)
select regions.name as region_name, round(avg(num_langs), 1) as avg_lang_count_per_country
from regions
left join (
    select countries.region_id, countries.country_id, count(country_languages.language_id) as num_langs
    from countries
    left join country_languages on countries.country_id = country_languages.country_id
    group by countries.region_id, countries.country_id
) as subquery on regions.region_id = subquery.region_id
group by regions.name
order by avg_lang_count_per_country desc;
12, Show the country name and its "national day" for the country with the most recent national day and the country with the oldest national day. Do this with a single query. (Hint: both subqueries and UNION may be helpful here). The output may look like this:
select name, national_day
from countries
where national_day = (select max(national_day) from countries)
union
select name, national_day
from countries
where national_day = (select min(national_day) from countries);
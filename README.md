## Part 1: Create an ER Diagram by inspecting tables
The continents table has a one-to-many relationship with the regions table, where one continent can have many regions.

The regions table has a one-to-many relationship with the countries table, where one region can have many countries.

The languages table has a many-to-many relationship with the countries table through the country_languages table, where one country can have many languages, and one language can be spoken by many countries.

The countries table has a one-to-many relationship with the country_languages table, where one country can have many languages, and one language can be spoken by many countries.

The countries table has a one-to-many relationship with the country_stats table, where one country can have multiple entries in the country_stats table for different years.

The regions table has a foreign key continent_id that references the continent_id primary key in the continents table. This enforces the one-to-many relationship between continents and regions, where each region belongs to one continent and each continent can have many regions.

The countries table has a foreign key region_id that references the region_id primary key in the regions table, which enforces the one-to-many relationship between regions and countries, where each country belongs to one region and each region can have many countries.

The country_languages table has foreign keys country_id and language_id that reference the country_id and language_id primary keys in the countries and languages tables, respectively. This allows for the many-to-many relationship between countries and languages, where a country can have many languages and a language can be spoken in many countries.

The country_stats table has a foreign key country_id that references the country_id primary key in the countries table. This enforces the one-to-many relationship between countries and country statistics, where each country can have multiple entries in the country_stats table for different years.

## Part 3: Write a sentence interpreting the results of your queries underneath the pasted output
From the queries, we got that event_date has missing values, product_type are dependent on product, description are dependent on product_code and we need look at both patient_age and age_units to get the age of the patient.

## Part 3: Examine a data set and create a normalized data model to store the data
![ER Diagram](./img/part3_03_caers_er_diagram.png)
Each table has a primary key. For example, in the event table, the primary key is report_id.

Foreign keys were added to link the event table to the product, symptom and outcomes tables. Because establishing relationships between the tables and ensure data integrity. For example, in the event table, the report_id column is a foreign key that references the product_code column in the product table.

The event table has a one-to-many relationship with the product, symptom, and outcomes tables.
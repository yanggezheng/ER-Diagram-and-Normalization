-- 1. this query tries to determine whether or not event_date has missing values
select created_date, event_date from staging_caers_event_product limit 10;
 created_date | event_date 
--------------+------------
 2022-09-30   | 
 2022-09-30   | 2022-08-26
 2022-09-30   | 
 2022-09-30   | 2022-04-14
 2022-09-30   | 2022-04-14
 2022-09-30   | 2022-04-14
 2022-09-30   | 2022-04-14
 2022-09-30   | 2022-09-29
 2022-09-30   | 2022-09-22
 2022-09-30   | 2022-09-29
(10 rows)

-- 2. this query tries to explore all age units and its max
SELECT age_units, MAX(patient_age)
FROM staging_caers_event_product
GROUP BY age_units;

 age_units |  max   
-----------+--------
 day(s)    | 365.00
 decade(s) |  10.00
 month(s)  |  59.00
 week(s)   |  63.00
 year(s)   | 116.00
           |       
(6 rows)

-- 3. this query tries to find the dependency between product_code and description
select product_code, description from staging_caers_event_product limit 10;
 product_code |              description               
--------------+----------------------------------------
 54           | Vit/Min/Prot/Unconv Diet(Human/Animal)
 53           | Cosmetics
 54           | Vit/Min/Prot/Unconv Diet(Human/Animal)
 02           | Whole Grain/Milled Grain Prod/Starch
 54           | Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           | Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           | Vit/Min/Prot/Unconv Diet(Human/Animal)
 37           | Mult Food Dinner/Grav/Sauce/Special
 23           | Nuts/Edible Seed
 05           | Cereal Prep/Breakfast Food
(10 rows)


-- 4. this query tries to find the dependency between product_type and product
select product_type, product from staging_caers_event_product limit 10;
 product_type |                       product                       
--------------+-----------------------------------------------------
 SUSPECT      | CENTRUM SILVER MEN'S 50+
 SUSPECT      | YOUNIQUE DAILY YOU LIQUID COLLAGEN SHOT
 SUSPECT      | CITRACAL CALCIUM CITRATE
 SUSPECT      | TRADER JOE'S GLUTEN FREE OATS
 CONCOMITANT  | Mag
 CONCOMITANT  | vitamin c &d
 CONCOMITANT  | zinc
 SUSPECT      | NEWMANS OWN THIN AND CRISPY PIZZA UNCURED PEPPERONI
 SUSPECT      | FLAGSTONE FOODS PRALINE PECANS
 SUSPECT      | GENERAL MILLS HONEY NUT CHEERIOS
(10 rows)

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

-- 2. this query tries to calculate the correct ages of each patient
select patient_age, age_units, case
    when age_units = 'week(s)' then patient_age/52
    when age_units = 'decade(s)' then patient_age*10
    when age_units = 'year(s)' then patient_age
    when age_units = 'month(s)' then patient_age/12
    when age_units = 'day(s)' then patient_age/365
end 
from staging_caers_event_product
where patient_age is not null
limit 10 offset 40;
 patient_age | age_units |        case        
-------------+-----------+--------------------
       83.00 | year(s)   |              83.00
       80.00 | year(s)   |              80.00
       26.00 | year(s)   |              26.00
       83.00 | year(s)   |              83.00
       65.00 | year(s)   |              65.00
       65.00 | year(s)   |              65.00
       18.00 | month(s)  | 1.5000000000000000
       65.00 | year(s)   |              65.00
       58.00 | year(s)   |              58.00
       58.00 | year(s)   |              58.00
(10 rows)

-- 3. this query tries to find unique values / candidate keys
select * from staging_caers_event_product limit 5 offset 15;
 staging_caers_event_product_id |    report_id    | created_date | event_date | product_type |               product               | product_code |              description               | patient_age | age_units |  sex   |                    terms                     |                                         outcomes                                          
--------------------------------+-----------------+--------------+------------+--------------+-------------------------------------+--------------+----------------------------------------+-------------+-----------+--------+----------------------------------------------+-------------------------------------------------------------------------------------------
                             16 | 2022-CFS-014619 | 2022-09-29   | 2022-09-03 | SUSPECT      | EXEMPTION 4                         | 54           | Vit/Min/Prot/Unconv Diet(Human/Animal) |       58.00 | year(s)   | Female | Arthralgia, Gait disturbance                 | Hospitalization, Other Serious or Important Medical Event, Visited a Health Care Provider
                             17 | 2022-CFS-014619 | 2022-09-29   | 2022-09-03 | SUSPECT      | EXEMPTION 4                         | 54           | Vit/Min/Prot/Unconv Diet(Human/Animal) |       58.00 | year(s)   | Female | Arthralgia, Gait disturbance                 | Hospitalization, Other Serious or Important Medical Event, Visited a Health Care Provider
                             18 | 2022-CFS-014605 | 2022-09-29   | 2022-09-28 | SUSPECT      | EXHALE WELLNESS DELTA-8 GUMMY CUBES | 33           | Candy W/O Choc/Special/Chew Gum        |       38.00 | year(s)   | Male   | Chest pain, Dizziness, Loss of consciousness | Hospitalization, Other Serious or Important Medical Event, Visited Emergency Room
                             19 | 2022-CFS-014605 | 2022-09-29   | 2022-09-28 | CONCOMITANT  | FISH OIL                            | 54           | Vit/Min/Prot/Unconv Diet(Human/Animal) |       38.00 | year(s)   | Male   | Chest pain, Dizziness, Loss of consciousness | Hospitalization, Other Serious or Important Medical Event, Visited Emergency Room
                             20 | 2022-CFS-014605 | 2022-09-29   | 2022-09-28 | CONCOMITANT  | MULTIVITAMINS                       | 54           | Vit/Min/Prot/Unconv Diet(Human/Animal) |       38.00 | year(s)   | Male   | Chest pain, Dizziness, Loss of consciousness | Hospitalization, Other Serious or Important Medical Event, Visited Emergency Room
(5 rows)

-- 4. this query tries to tell the dependency between product_code and product
select product_code, product from staging_caers_event_product limit 10;
 product_code |                       product                       
--------------+-----------------------------------------------------
 54           | CENTRUM SILVER MEN'S 50+
 53           | YOUNIQUE DAILY YOU LIQUID COLLAGEN SHOT
 54           | CITRACAL CALCIUM CITRATE
 02           | TRADER JOE'S GLUTEN FREE OATS
 54           | Mag
 54           | vitamin c &d
 54           | zinc
 37           | NEWMANS OWN THIN AND CRISPY PIZZA UNCURED PEPPERONI
 23           | FLAGSTONE FOODS PRALINE PECANS
 05           | GENERAL MILLS HONEY NUT CHEERIOS
(10 rows)

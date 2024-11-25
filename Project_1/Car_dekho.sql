create schema cars;
use cars;
-- Read Table Data --
select *  from car_dekho;

-- Count the number of cars--
select count(Name) As 'Number of Cars'from car_dekho;

-- How many cars will be available in 2023--
select count(Name) As 'Number of Cars in 2023'from car_dekho where year=2023;

-- How many cars will be available in 2020,2021,2022--
select year,count(Name) As 'Number of Cars in 2020,2021,2022'from car_dekho where year in (2020,2021,2022) group by year;

-- Total numbers of Cars group by year--
select year,count(*) As 'Number of Cars'from car_dekho group by year;

-- Total numbers of diesel car in 2020--
select count(*) As 'Number of Diesel Cars in 2020'from car_dekho  where year= 2020 and fuel='Diesel';

-- Total numbers of petrol car in 2020--
select count(*) As 'Number of Petrol Cars in 2020'from car_dekho  where year= 2020 and fuel='Petrol';

-- Numbers of cars according their fuel type and year--
SELECT 
    year,
    SUM(CASE WHEN fuel = 'Petrol' THEN 1 ELSE 0 END) AS Petrol,
    SUM(CASE WHEN fuel = 'Diesel' THEN 1 ELSE 0 END) AS Diesel,
    SUM(CASE WHEN fuel = 'CNG' THEN 1 ELSE 0 END) AS CNG
FROM car_dekho 
GROUP BY year;

-- Which year had more than 100 Cars--
select year,count(*) from car_dekho group by year having count(*)>99;

-- All cars count between 2015 and 2023--
select year,count(*) from car_dekho group by year having year between 2015 and 2023;#shows all year
select count(*) from car_dekho where year between 2015 and 2023;#sum of all years 

-- 	Shows the complete details of cars between 2015 and 2023--
select * from car_dekho where year between 2015 and 2023;
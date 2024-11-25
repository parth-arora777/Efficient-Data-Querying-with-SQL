create database retail_data;
use retail_data;
-- Create Table

CREATE TABLE data (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

-- Show TABLE
SELECT * FROM data;

-- Count number of rows

SELECT COUNT(*) FROM DATA;
-- delete null values
DELETE FROM data
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
    
		-- Data Exploration
-- How many Sales we have
SELECT COUNT(*) As Total_sales
 FROM data;   
 
-- How many uniuque customers we have

SELECT COUNT(DISTINCT customer_id) As Number_of_Unique_Customer from data;

-- differnt types of Catgeory

SELECT DISTINCT category FROM data;

    
    
    
    
    
    
    
    
    
    
    
    
    
    -- DATA ANALYSIS
    
-- Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT * FROM data WHERE sale_date = "2022-11-05";

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 1 in the month of Nov-2022:
SELECT * FROM data WHERE category = 'Clothing' 
AND quantity > 1 
AND DATE_FORMAT(sale_date, '%Y-%m') ='2022-11';

-- Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT category,Sum(total_sale) FROM data GROUP BY category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
 SELECT avg(age) AS 'Average Age' FROM data WHERE category ='Beauty';
 
 -- Write a SQL query to find all transactions where the total_sale is greater than 1000.:
 SELECT * FROM data WHERE total_sale>1000;
 
 -- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
 SELECT category,gender,count(*) FROM data group by category,gender order by 1;
 
 -- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
 
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
		ROUND(AVG(total_sale),2)AS average_sale
FROM 
    data
GROUP BY 
    YEAR(sale_date), MONTH(sale_date)
ORDER BY 
    YEAR(sale_date), MONTH(sale_date);
    
-- **Write a SQL query to find the top 5 customers based on the highest total sales **:

SELECT customer_id,SUM(total_sale) As Total_Sales FROM data 
GROUP BY
	customer_id
ORDER BY	
	Total_Sales desc
LIMIT 5;
 
 -- Write a SQL query to find the number of unique customers who purchased items from each category.:
 SELECT category,Count(distinct customer_id) As Unique_Customer from data
 GROUP BY
	category;
    
-- Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
SELECT CASE
	WHEN HOUR(sale_time)<12 THEN "Morning"
    WHEN HOUR(sale_time) BETWEEN  12 AND 17 THEN "Afternoon"
    ELSE "Evening"
End as Shift,
Count(*) As Number_of_Order
FROM data
GROUP BY Shift;

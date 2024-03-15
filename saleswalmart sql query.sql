CREATE DATABASE salewalmart;
CREATE table SALES(
Invoice_ID VARCHAR(30) NOT NULL PRIMARY KEY,
Branch varchar(5) NOT NULL,
City VARCHAR(30) NOT NULL,
Customer_type VARCHAR(30) NOT NULL,
Gender VARCHAR(10) NOT NULL,
Product_line VARCHAR(100) NOT NULL,
Unit_price DECIMAL(10, 2) NOT NULL,
Quntity INT NOT NULL,
VAT FLOAT(6, 4) NOT NULL,
Total DECIMAL(10, 2) NOT NULL,
Date  DATE NOT NULL,
Time TIME NOT NULL,
payment_method VARCHAR(50) NOT NULL,
cogs DECIMAL(10, 2) NOT NULL,
gross_mergin_percentage FLOAT(11, 9),
gross_income DECIMAL(10, 2) NOT NULL,
Rating FLOAT(2, 1)
);


-- ---------------------------------------------------------------------------------------------------
-- ----------------------------------feature enginnering-------------------------------------------


-- time_of_day--

SELECT 
	time,
    (CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
    ) AS time_of_date	
FROM SALES;

ALTER table sales ADD column time_of_day varchar(20);

UPDATE sales 
SET time_of_day =(
	
    CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
);

-- ---------------------------------------------------------------------
-- ------------------ day_name -----------------------------------------

SELECT 
	date,
    DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD column day_name VARCHAR(20);

UPDATE sales
SET day_name= (
    DAYNAME(date)
);

-- ------------------------------------------------------------------------
-- --------------------- month_name ---------------------------------------
SELECT 
	date,
    monthname(date)
FROM sales;

ALTER TABLE sales ADD column month_name VARCHAR(10);

UPDATE sales
SET month_name= (
	monthname(date)
);

-- -----------------------------------------------------------------------------------------------------


-- --------------------------------------------------------------------------------
-- ------------------------ GENERIC -----------------------------------------------

-- HOW MANY UNIQUE CITIES DOES THE DATE HAVE? ----------------

SELECT 	
	distinct CITY
FROM sales;


-- IN WHICH CITY IS EACH BRANCH? ---------------------

SELECT
	distinct branch
FROM sales;

SELECT 
	distinct CITY,
    Branch
FROM sales;


-- HOW MANY UNQIUE PRODUCT LINES DOES THE DATA HAVE? ------------------

SELECT 
	COUNT(distinct Product_line)
 FROM sales;
 
  
-- WHAT IS THE MOST COMMON PAYMENT METHOD? -------------------------------

SELECT
	payment_method,
	COUNT(Payment_method) AS cnt
FROM sales
GROUP BY Payment_method
ORDER BY CNT desc;
 
 
 -- WHAT IS THE MOST SELLING PRODUCT LINE? -----------------------------
 SELECT 
	Product_line,
	COUNT(product_line)
FROM sales
GROUP BY Product_line;

--  WHAT IS THE TOTAL REVENUE BY MONTH? ------------------------------------

SELECT
	month_name as month,
    SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue;

-- what month had lagest COGS? --------------------------------------------

SELECT 
	month_name as month,
    sum(cogs) AS cogs
FROM SALES
GROUP BY Month_name
ORDER BY COGS DESC ;

-- WHAT PRODUCT LINE HAS THE LAGEST REVENUE? --------------------

SELECT 
	product_line,
    sum(total) AS total_revenue
FROM SALES
GROUP BY product_line
ORDER BY total_revenue DESC ;

-- WHAT IS THE CITY WITH THE LAGRGEST REVENUE? ------------------------
SELECT 
	CITY,
    sum(total) AS total_revenue
FROM SALES
GROUP BY CITY, branch
ORDER BY total_revenue DESC;

-- WHAT PRODUCT LINE HAD THE LARGEST VAT? -------------------------------
SELECT 
	product_line,
    AVG(VAT) AS avg_tax
FROM SALES
GROUP BY product_line
ORDER BY avg_tax DESC;

-- FETCH EACH PRODUCT LINE AND ADD A COLUMN TO THOSEPRODUCT LINESHOWING
-- "G"GOOD","BAD". IF ITS GREATER THEN AVERAGE SLAES?

SELECT 	
	branch,
    sum(quntity) AS QTY
FROM SALES
GROUP BY branch
HAVING SUM(quntity) > (SELECT AVG(QUNTITY) FROM SALES);

-- WHAT IS THE MOST COMMON PRODUCT LINE BY GENDER? ----------------------------------
SELECT 
	gender,
	product_line,
    count(total) AS total_cnt
FROM SALES
GROUP BY gender,product_line
ORDER BY total_cnt desc;

-- WHAT IS THE AVERAGE RATING OF EACH PRODUCT LINE? ------------------------------------

SELECT 
    ROUND(avg(rating),2) AS avg_rating,
    product_line
FROM SALES
GROUP BY product_line
order by avg_rating desc;

-- ----------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------
-- -----------------------------------SALES---------------------------------------------

-- NUMBER OF SALES MADE IN EACH TIME OF THE DAY PER WEEKDAY?------------------------

	SELECT 
		Time_of_day,
		COUNT(*) AS TOTAL_SALES
	FROM SALES
	WHERE day_name = "monday"
	GROUP BY time_of_day
	order by total_sales DESC;
    
-- WHICH OF THE CUSTOMER TYPES BRINGS THE MOST REVENUE?--------------------------

SELECT
	customer_type,
    SUM(total) AS total_revenue
FROM SALES
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- WHICH CITY HAS THE LARGEST TAX PERCENT/ VAT(VALUE ADD TAX)?----------------
SELECT 
	city,
    AVG(VAT) AS VAT
FROM SALES
GROUP BY city
ORDER BY vat DESC;

-- WHICH CUSTOMER TYPE PAYS THE MOST IN VAT?---------------------------------
SELECT
	customer_type,
    avg(VAT) AS VAT
FROM SALES
GROUP BY customer_type
ORDER BY VAT DESC;

-- -------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------
-- -----------------------------CUSTOMER-----------------------------------------------
-- -----------------------------------------------------------------------------------------

-- HOW MANY UNIQUE CUSTOMER TYPES DOES THE DATA HAVE?----------------
SELECT 
	distinct customer_type
FROM SALES;

-- How many unique payment methods does the data have?-------------------------
SELECT 
	distinct payment_method
FROM SALES;

-- Which customer type buys the most?-------------------------------------------

SELECT 
	customer_type,
    COUNT(*) AS CSTM_CNT
FROM SALES
GROUP BY customer_type;

-- What is the gender of most of the customers?----------------------------------

SELECT 
	gender,
    COUNT(*) AS cstm_cnt
FROM SALES
GROUP BY gender ;

-- What is the gender distribution per branch?------------------------------------

SELECT
	gender,
    COUNT(*) AS gender_cnt
FROM SALES
WHERE branch ="C"
GROUP BY gender 
ORDER BY gender_cnt DESC;

-- Which time of the day do customers give most ratings?--------------------------

SELECT 
	time_of_day,
    AVG(rating) AS avg_rating
FROM SALES
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?----------------------

SELECT 
	time_of_day,
    AVG(rating) AS avg_rating
FROM SALES
WHERE branch ="A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?------------------------------------------
SELECT 
	day_name,
    AVG(rating) AS avg_rating
FROM SALES
GROUP BY day_name
ORDER BY aVg_rating DESC;

-- Which day of the week has the best average ratings per branch?-----------------------------
SELECT 
	day_name,
    AVG(rating) AS avg_rating
FROM SALES
WHERE branch="A"
GROUP BY day_name
ORDER BY aVg_rating DESC;

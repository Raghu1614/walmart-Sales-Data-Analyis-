
# WALMART SALES DATA ANALYSIS WITH SQL

Walmart sales data for 45 Walmart stores located in different regions. Each store contains a number of departments,product details,customer details.The aims is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting

In this recruiting competition, job-seekers are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact. Source-https://www.kaggle.com/c/walmart-recruiting-store-sales-forecasting
## Purpose pf the Project
The main goal of this project is to obtain insight into Walmart's sales data to comprehend the various aspects that influence sales at the various branches.
## About Data
This DataSet was taken from Kaggle Walmart Sales Forecasting Competition.This data Contains  17 Columns and 1000 rows of sales Transaction, customer details, product details, city, branch .


Column                        Description
invoice_id      
Invoice of the sales made
branch
Branch at which sales were made
city
The location of the branch    
customer_type   
The type of the customer
gender
Gender of the customer making purchase
product_line    
Product line of the product sole
unit_price
The price of each product
quantity
quantity
VAT
The amount of tax on the purchase
total
The total cost of the purchase
date
The date on which the purchase was made
time
The time at which the purchase was made
payment_method  
The total amount paid
cogs
Cost Of Goods sold
gross_margin_
percentage
Gross margin percentage
gross_income    
Gross Income
rating          
Rating


## Analysis 
TYPE OF ANALYSIS
1. Product Analysis
2. Sales Analysis
3. Customer Analysis


BUSINESS QUESTIONS

Generic 

1 How many unique cities does the data have?
2 In which city is each branch?

1. Product Analysis

1 How many unique product lines does the data have?
2 What is the most common payment method?
3 What is the most selling product line?
4 What is the total revenue by month?
5 What month had the largest COGS?
6 What product line had the largest revenue?
7 What is the city with the largest revenue?
8 What product line had the largest VAT?
9 Fetch each product line and add a column to those product line 10 showing "Good", "Bad". Good if its greater than average sales
11 Which branch sold more products than average product sold?
12 What is the most common product line by gender?
13 What is the average rating of each product line?

2. sales Analysis

1 Number of sales made in each time of the day per weekday
2 Which of the customer types brings the most revenue?
3 Which city has the largest tax percent/ VAT (Value Added Tax)?
4 Which customer type pays the most in VAT?

3. customer Analysis

1 How many unique customer types does the data have?
2 How many unique payment methods does the data have?
3 What is the most common customer type?
4 Which customer type buys the most?
5 What is the gender of most of the customers?
6 What is the gender distribution per branch?
7 Which time of the day do customers give most ratings?
8 Which time of the day do customers give most ratings per branch?
9 Which day fo the week has the best avg ratings?
10 Which day of the week has the best average ratings per branch?

## Approach 
1. Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.

a. Build a database
b. Create table and insert the data.
c. Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

1.1. Feature Engineering: This will help use generate some new columns from existing ones.

a. Add a new column named "time_of_day" to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

b. Add a new column named "day_name" that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

c. Add a new column named "month_name" that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

2. Exploratory Data Analysis (EDA): Exploratory data analysis is  done to answer the listed questions and aims of this project.

3. Conclusion

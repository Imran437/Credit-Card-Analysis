-- Data Overview


SELECT *
FROM customer_details
LIMIT 10;


SELECT *
FROM cc_details
LIMIT 10;


-- Number of rows in the data

SELECT
COUNT(*) AS customer_count
FROM customer_details;


SELECT
COUNT(*) AS credit_card_count
FROM cc_details;


-- Check missing values in the data


SELECT *
FROM customer_details
WHERE client_num IS NULL;


SELECT *
FROM cc_details
WHERE client_num IS NULL;


-- Check duplicate data

SELECT
client_num, COUNT(*) AS cnt
FROM customer_details
GROUP BY client_num
HAVING COUNT(*) > 1;


SELECT
client_num, COUNT(*) AS cnt
FROM cc_details
GROUP BY client_num
HAVING COUNT(*) > 1;


-- Check Specific columns
-- in customer_details table

SELECT 
DISTINCT cust_satisfaction_score
FROM customer_details;


SELECT
DISTINCT contact
FROM customer_details;

SELECT
DISTINCT customer_job
FROM customer_details;


SELECT
DISTINCT dependent_count
FROM customer_details;

SELECT
DISTINCT education_level
FROM customer_details;

-- In cc_details table

SELECT
DISTINCT card_category
FROM cc_details;

SELECT
DISTINCT use_chip
FROM cc_details;


SELECT
DISTINCT qtr
FROM cc_details;

SELECT
DISTINCT exp_type
FROM cc_details;

SELECT
DISTINCT delinquent_acc
FROM cc_details;
 
-- For numerical columns

SELECT
MIN(customer_age) AS min_age,
MAX(customer_age) AS max_age
FROM customer_details;


-- income

SELECT
MIN(income) AS min_income,
MAX(income) AS max_income
FROM customer_details;

SELECT DISTINCT
current_year
FROM cc_details;
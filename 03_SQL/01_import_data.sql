-- SQL Query to create and import data from csv files:

-- 0. Create a database 
CREATE DATABASE ccdb;


-- 1. Create customer_details table

CREATE TABLE customer_details (
    client_num BIGINT PRIMARY KEY,
    customer_age INT,
    gender VARCHAR(10),
    dependent_count INT,
    education_level VARCHAR(50),
    marital_status VARCHAR(50),
    state_cd VARCHAR(10),
    zipcode INT,
    car_owner VARCHAR(10),
    house_owner VARCHAR(10),
    personal_loan VARCHAR(10),
    contact VARCHAR(20),
    customer_job VARCHAR(50),
    income DECIMAL(12,2),
    cust_satisfaction_score INT
);


-- 02. Create cc_details table

CREATE TABLE cc_details (
    client_num BIGINT PRIMARY KEY,
    card_category VARCHAR(50),
    annual_fees DECIMAL(10,2),
    activation_30_days INT,
    customer_acq_cost DECIMAL(10,2),
    week_start_date DATE,
    week_num VARCHAR(20),
    qtr VARCHAR(10),
    current_year INT,
    credit_limit DECIMAL(12,2),
    total_revolving_bal DECIMAL(12,2),
    total_trans_amt DECIMAL(12,2),
    total_trans_ct INT,
    avg_utilization_ratio DECIMAL(10,4),
    use_chip VARCHAR(20),
    exp_type VARCHAR(50),
    interest_earned DECIMAL(12,2),
    delinquent_acc INT,
    FOREIGN KEY (client_num)
        REFERENCES customer_details(client_num)
);

-- 3. Copy csv data into SQL

-- copy customer_details table

COPY customer_details
FROM 'C:/Work/Projects/Credit-Card-Analysis/01_Data/cust_details_cleaned.csv' 
DELIMITER ',' 
CSV HEADER;

-- copy cc_detail table

COPY cc_details
FROM 'C:/Work/Projects/Credit-Card-Analysis/01_Data/cc_details_cleaned.csv' 
DELIMITER ',' 
CSV HEADER;


-- Verify after importing the csv data

SELECT
COUNT(*)
FROM cc_details;

SELECT
COUNT(*)
FROM customer_details;

SELECT *
FROM cc_details 
LIMIT 10;

SELECT *
FROM customer_details
LIMIT 10;

-- Customer Analysis


SELECT *
FROM customer_details
LIMIT 10;

-- Validate the Join

SELECT COUNT(*)
FROM cc_details c
INNER JOIN customer_details cu
ON c.client_num = cu.client_num;



-- Gender-wise transaction analysis

SELECT
cu.gender,
SUM(cc.total_trans_amt) AS total_transaction_amount,
ROUND(AVG(cc.total_trans_amt),2) AS avg_transaction_amount,
SUM(cc.total_trans_ct) AS total_transaction_count
FROM customer_details cu
JOIN cc_details cc
ON cu.client_num = cc.client_num
GROUP BY cu.gender
ORDER BY total_transaction_amount DESC;

-- Eduation Level wise transaction analysis

SELECT
cu.education_level,
SUM(cc.total_trans_amt) AS total_transaction_amount,
SUM(cc.interest_earned) AS total_interest_earned
FROM customer_details cu
JOIN cc_details cc
ON cu.client_num = cc.client_num
GROUP BY cu.education_level
ORDER BY total_transaction_amount DESC;


-- Job-wise customer value

SELECT
cu.customer_job,
COUNT(*) AS customers,
SUM(cc.total_trans_amt) AS total_transaction_amount,
SUM(cc.interest_earned) AS total_interest,
ROUND(AVG(cc.credit_limit),2) AS avg_credit_limit
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
GROUP BY cu.customer_job
ORDER BY total_transaction_amount DESC;


-- Marital status wise analysis

SELECT
cu.marital_status,
COUNT(*) AS customers,
SUM(cc.total_trans_amt) AS total_transaction_amount,
SUM(total_trans_ct) AS total_transaction_count,
ROUND(AVG(cc.credit_limit),2) AS avg_credit_limit
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
GROUP BY cu.marital_status
ORDER BY total_transaction_amount DESC;


-- State wise analysis

SELECT
cu.state_cd,
SUM(cc.total_trans_amt) AS total_transaction_amount,
SUM(cc.total_trans_ct) AS total_transaction_count,
ROUND(AVG(cc.interest_earned),2) AS avg_interest_earned
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
GROUP BY cu.state_cd
ORDER BY total_transaction_amount DESC;


-- Car Ownership wise analysis

SELECT
cu.car_owner,
SUM(cc.total_trans_amt) AS total_transaction_amount,
ROUND(AVG(cc.interest_earned),2) AS avg_interest_earned
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
GROUP BY cu.car_owner
ORDER BY total_transaction_amount DESC;


-- House ownership by analysis

SELECT
cu.house_owner,
SUM(cc.total_trans_amt) AS total_transaction_amount,
ROUND(AVG(cc.interest_earned),2) AS avg_interest_earned
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
GROUP BY cu.house_owner
ORDER BY total_transaction_amount DESC;
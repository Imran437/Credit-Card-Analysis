-- Customer Segmentation

-- Age group analysis

WITH age_group_cte AS(
SELECT cc.total_trans_amt, cc.credit_limit,
CASE
WHEN cu.customer_age <= 25 THEN '18-25'
WHEN cu.customer_age <= 35 THEN '26-35'
WHEN cu.customer_age <= 45 THEN '36-45'
WHEN cu.customer_age <= 55 THEN '46-55'
WHEN cu.customer_age <= 65 THEN '56-65'
ELSE '65+'
END AS age_group
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
)
SELECT age_group,
COUNT(*) AS customers,
SUM(total_trans_amt) AS total_transaction_amount,
ROUND(AVG(credit_limit), 2) AS avg_credit_limit
FROM age_group_cte
GROUP BY age_group
ORDER BY total_transaction_amount DESC;


-- Income Group Analysis

WITH income_group_cte AS(
SELECT
cc.total_trans_amt, cc.total_trans_ct, cc.credit_limit,
CASE
WHEN cu.income < 30000 THEN 'Low'
WHEN cu.income < 60000 THEN 'Medium'
WHEN cu.income < 100000 THEN 'High'
ELSE 'Very High'
END AS income_group
FROM cc_details cc
JOIN customer_details cu
ON cc.client_num = cu.client_num
)
SELECT income_group,
COUNT(*) AS customers,
SUM(total_trans_amt) AS total_transaction_amount,
ROUND(AVG(credit_limit), 2) AS avg_credit_limit
FROM income_group_cte
GROUP BY income_group
ORDER BY total_transaction_amount DESC;
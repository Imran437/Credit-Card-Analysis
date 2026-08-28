-- Risk and delinquency analysis


-- Overall Risk Rate

SELECT
ROUND(AVG(delinquent_acc) * 100, 2) AS delinquency_rate
FROM cc_details;


-- Delinquency by customer job

SELECT
cu.customer_job,
COUNT(*) AS total_customers,
SUM(c.delinquent_acc) AS delinquent_customers,
ROUND(
        AVG(c.delinquent_acc) * 100,
        2
    ) AS delinquency_rate
FROM cc_details c
JOIN customer_details cu
    ON c.client_num = cu.client_num
GROUP BY cu.customer_job
ORDER BY delinquency_rate DESC;

-- -- Delinquency by Age Group


WITH age_group_cte AS(
SELECT cc.delinquent_acc,
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
COUNT(*) AS total_customers,
SUM(delinquent_acc) AS delinquent_customers,
ROUND(
    AVG(delinquent_acc) * 100, 2
    ) AS delinquency_rate
FROM age_group_cte
GROUP BY age_group
ORDER BY delinquency_rate DESC;


-- Delinquency by Income Group

WITH income_group_cte AS(
SELECT
cc.delinquent_acc,
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
SUM(delinquent_acc) AS delinquent_customers,
ROUND(
        AVG(delinquent_acc) * 100,
        2
    ) AS delinquency_rate
FROM income_group_cte
GROUP BY income_group
ORDER BY delinquency_rate DESC;


-- Delinquency by marital_status

SELECT
cu.marital_status,
COUNT(*) AS total_customers,
SUM(cc.delinquent_acc) AS delinquent_customers,
ROUND(
        AVG(cc.delinquent_acc) * 100,
        2
    ) AS delinquency_rate
FROM cc_details cc
JOIN customer_details cu
    ON cc.client_num = cu.client_num
GROUP BY cu.marital_status
ORDER BY delinquency_rate DESC;


-- Delinquency by card category

SELECT
card_category,
COUNT(*) AS total_customers,
SUM(delinquent_acc) AS delinquent_customers,
ROUND(
        AVG(delinquent_acc) * 100,
        2
    ) AS delinquency_rate
FROM cc_details
GROUP BY card_category
ORDER BY delinquency_rate DESC;
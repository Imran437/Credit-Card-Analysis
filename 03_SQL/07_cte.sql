-- CTEs

-- Find customer jobs with above-average transaction amounts

WITH job_performance AS (
    SELECT
        cu.customer_job,
        AVG(c.total_trans_amt) AS avg_transaction
    FROM cc_details c
    JOIN customer_details cu
        ON c.client_num = cu.client_num
    GROUP BY cu.customer_job
)

SELECT *
FROM job_performance
WHERE avg_transaction > (
    SELECT AVG(total_trans_amt)
    FROM cc_details
);

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
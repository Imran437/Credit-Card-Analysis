-- Basic Analysis


SELECT
COUNT(*) AS total_customers,
SUM(total_trans_amt) AS total_transaction_amount,
SUM(total_trans_ct) AS total_transaction_count,
ROUND(AVG(credit_limit),2) AS avg_credit_limit,
SUM(interest_earned) AS total_interest_earned
FROM cc_details;


-- Card Category Analysis

SELECT
card_category,
SUM(total_trans_amt) AS total_transaction_amount,
SUM(interest_earned) AS total_interest_earned,
ROUND(AVG(credit_limit),2) AS avg_credit_limit
FROM cc_details
GROUP BY card_category
ORDER BY total_transaction_amount DESC;


-- Expense type analysis

SELECT
exp_type,
SUM(total_trans_amt) AS total_transaction_amount,
SUM(total_trans_ct) AS total_transaction_count
FROM cc_details
GROUP BY exp_type
ORDER BY total_transaction_amount DESC;


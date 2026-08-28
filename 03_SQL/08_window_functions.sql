-- Window Functions

-- Rank customers by transaction amount

SELECT
client_num, total_trans_amt,
RANK() OVER (ORDER BY total_trans_amt DESC) AS transaction_rank
FROM cc_details;


-- Rank customers within each card category

SELECT
    client_num,
    card_category,
    total_trans_amt,

    DENSE_RANK() OVER (
        PARTITION BY card_category
        ORDER BY total_trans_amt DESC
    ) AS customer_rank

FROM cc_details;
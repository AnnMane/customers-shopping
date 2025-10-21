-- categorize customers into age groups and count purchases per category
SELECT 
    payment_method,
    COUNT(*) AS transaction_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_shopping_data), 2) AS percent_share
FROM customer_shopping_data
GROUP BY payment_method
ORDER BY transaction_count DESC;
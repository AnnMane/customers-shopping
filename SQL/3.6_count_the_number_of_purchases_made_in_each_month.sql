-- count the number of purchases made in each month

SELECT 
    EXTRACT(MONTH FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS month,
    COUNT(*) AS purchases
FROM customer_shopping_data
GROUP BY month
ORDER BY month;

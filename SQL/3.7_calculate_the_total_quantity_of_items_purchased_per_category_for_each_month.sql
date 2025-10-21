-- calculate the total quantity of items purchased per category for each month

SELECT 
    category, 
    EXTRACT(MONTH FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS month,
    SUM(quantity) AS total_quantity
FROM customer_shopping_data
GROUP BY category, month
ORDER BY category, month;

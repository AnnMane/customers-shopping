--- Total sales and transactions per shopping mall per year
SELECT
    EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS year,
	shopping_mall,
    SUM(price * quantity) AS total_sales,
    COUNT(DISTINCT invoice_no) AS transactions
FROM customer_shopping_data
GROUP BY shopping_mall, year
ORDER BY shopping_mall, year;

 
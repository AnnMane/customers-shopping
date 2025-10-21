-- Monthly sales trends
 SELECT
     EXTRACT(MONTH FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS month,
     SUM(price * quantity) AS total_sales,
     COUNT(*) AS trans_count
 FROM customer_shopping_data
 GROUP BY month
 ORDER BY total_sales DESC;
 

-- Transaction trends over time (monthly)
SELECT
  COUNT(*) AS transactions,
  EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS year,
  EXTRACT(MONTH FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS month
FROM customer_shopping_data
GROUP BY year, month
ORDER BY year, month;
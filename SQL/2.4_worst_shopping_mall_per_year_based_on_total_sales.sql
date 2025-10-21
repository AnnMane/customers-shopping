 -- Worst shopping mall per year based on total sales - just changeing DESC to ASC in the previous query
 SELECT
     year,
     shopping_mall,
     total_sales
 FROM (
     SELECT
         EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS year,
         shopping_mall,
         SUM(price * quantity) AS total_sales,
         RANK() OVER (
             PARTITION BY EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY'))
             ORDER BY SUM(price * quantity) ASC
         ) AS sales_rank
     FROM customer_shopping_data
     WHERE EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) IN (
 2021, 2022, 2023
     )
     GROUP BY year, shopping_mall
 ) ranked
 WHERE sales_rank = 1
 ORDER BY year;
 

-- Each SQL statement in this file was run separately in the database editor (e.g. pgAdmin).
-- This file is a collection of all the data cleaning and exploration queries I used during the analysis.
-- It is meant for documentation purposes, not for running all queries at once.

--- Total sales and transactions per shopping mall per year
SELECT
    EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS year,
	shopping_mall,
    SUM(price * quantity) AS total_sales,
    COUNT(DISTINCT invoice_no) AS transactions
FROM customer_shopping_data
GROUP BY shopping_mall, year
ORDER BY shopping_mall, year;

-- Top shopping mall per year based on total sales
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
            ORDER BY SUM(price * quantity) DESC
        ) AS sales_rank
    FROM customer_shopping_data
    WHERE EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) IN (2021, 2022, 2023)
    GROUP BY year, shopping_mall
) ranked
WHERE sales_rank = 1
ORDER BY year;

-- Top 10 product categories by revenue
SELECT
    category,
    SUM(price * quantity) AS revenue
FROM customer_shopping_data
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;

-- Monthly sales trends
SELECT
    EXTRACT(MONTH FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS month,
    SUM(price * quantity) AS total_sales,
    COUNT(*) AS trans_count
FROM customer_shopping_data
GROUP BY month
ORDER BY total_sales DESC;

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

-- Date range of the dataset
SELECT
  MIN(TO_DATE(invoice_date, 'DD/MM/YYYY')) AS earliest,
  MAX(TO_DATE(invoice_date, 'DD/MM/YYYY')) AS latest
FROM customer_shopping_data;


-- Each SQL statement in this file was run separately in the database editor (e.g. pgAdmin).
-- This file is a collection of all the data cleaning and exploration queries I used during the analysis.
-- It is meant for documentation purposes, not for running all queries at once.

-- Check for missing values in each column
SELECT
  SUM(CASE WHEN invoice_no IS NULL THEN 1 ELSE 0 END) AS missing_invoice_no,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
  SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
  SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
  SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
  SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
  SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price,
  SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS missing_payment_method,
  SUM(CASE WHEN invoice_date IS NULL THEN 1 ELSE 0 END) AS missing_invoice_date,
  SUM(CASE WHEN shopping_mall IS NULL THEN 1 ELSE 0 END) AS missing_shopping_mall
FROM customer_shopping_data;

-- Check for duplicate records based on invoice_no and customer_id
SELECT
  invoice_no, customer_id, COUNT(*)
FROM customer_shopping_data
GROUP BY invoice_no, customer_id
HAVING COUNT(*) > 1;

-- Analysis of Age, Gender, and Localization 
MIN(age) AS min_age, MAX(age) AS max_age, AVG(age) AS avg_age FROM customer_shopping_data;

-- Gender
SELECT gender, COUNT(*) FROM customer_shopping_data GROUP BY gender;

-- Localization
SELECT shopping_mall, COUNT(*) FROM customer_shopping_data GROUP BY shopping_mall;

-- Date consistency verification 
SELECT
  MIN(invoice_date) AS earliest, MAX(invoice_date) AS latest
FROM customer_shopping_data;

-- Transaction trends over time (monthly)
SELECT
  COUNT(*) AS transactions,
  EXTRACT(YEAR FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS year,
  EXTRACT(MONTH FROM TO_DATE(invoice_date, 'DD/MM/YYYY')) AS month
FROM customer_shopping_data
GROUP BY year, month
ORDER BY year, month;
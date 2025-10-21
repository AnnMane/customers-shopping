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


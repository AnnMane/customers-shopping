
-- Check for duplicate records based on invoice_no and customer_id
SELECT
  invoice_no, customer_id, COUNT(*)
FROM customer_shopping_data
GROUP BY invoice_no, customer_id
HAVING COUNT(*) > 1;


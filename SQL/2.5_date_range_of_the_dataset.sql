 -- Date range of the dataset
 SELECT
   MIN(TO_DATE(invoice_date, 'DD/MM/YYYY')) AS earliest,
   MAX(TO_DATE(invoice_date, 'DD/MM/YYYY')) AS latest
 FROM customer_shopping_data;


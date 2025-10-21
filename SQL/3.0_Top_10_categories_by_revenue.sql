-- Top 10 categories by revenue

SELECT
    category,
    SUM(price * quantity) AS revenue
FROM customer_shopping_data
GROUP BY category
ORDER BY revenue DESC
LIMIT 10; 
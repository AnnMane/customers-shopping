-- Age, sex, and location distribution of customers

SELECT 
    gender,
    shopping_mall,
    COUNT(DISTINCT customer_id) AS customer_count,
    AVG(age) AS average_age,
    MIN(age) AS youngest_age,
    MAX(age) AS oldest_age
FROM
    customers_shopping_data
GROUP BY gender, shopping_mall
ORDER BY shopping_mall, gender;
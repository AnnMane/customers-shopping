-- analyze customer shopping data by gender

SELECT gender,
    CASE
        WHEN age < 18 THEN 'under 18'
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'over 50'
    END AS age_group,
    category,
    COUNT(*) AS purchases
FROM customer_shopping_data
GROUP BY gender, age_group, category
ORDER BY gender, age_group, purchases DESC;

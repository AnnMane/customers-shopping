-- SQL query to categorize customers into age groups and count purchases per category

SELECT
    CASE 
		WHEN age < 18 then 'ponizej 18'
		when age between 18 and 25 then '18-25'
		when age between 26 and 25 then '26-35'
		when age between 36 and 50 then '36-50'
		else 'powyzej 50'
	end as age_group,
	category,
	count(*) as number_of_purchases
from customer_shopping_data
group by age_group, category
order by age_group, number_of_purchases desc;
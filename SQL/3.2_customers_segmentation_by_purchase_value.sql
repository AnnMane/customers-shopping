-- customers segmentation by purchase value and mumber of transactions

SELECT
    customer_id,
  	price * quantity AS total_spent,
	CASE
		when price*quantity<2000 THEN 'low'
		when price*quantity<4000 then 'medium'
	else 'high'
end as segment
	
FROM
customer_shopping_data
order by total_spent desc;



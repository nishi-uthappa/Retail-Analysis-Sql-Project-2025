-- The average age of customers who have purchased from categories Clothings and Electronics individually.
SELECT category,
    ROUND(AVG(age), 0) AS average_age
FROM retail_sales
WHERE category IN ('Clothing', 'Electronics')
GROUP BY category;
-- Answer: The average age forboth the categories is 42.
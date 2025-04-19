-- Question: Which product category has the highest total sales?
SELECT category,
    SUM(total_sale) AS total_number_of_sales
FROM retail_sales
GROUP BY category
ORDER BY total_number_of_sales DESC
LIMIT 1;
--Answer: Electronics has the hightest number of sales
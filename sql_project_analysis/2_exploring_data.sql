-- 1. Total number of sales in this data?
SELECT COUNT(*) AS total_number_of_sales
FROM retail_sales -- Answer: 1987
    -- 2. Total number of customers?
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales --Answer: 155 customer.
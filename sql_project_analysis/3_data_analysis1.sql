-- Question: Total Revenue generated in this dataset?
SELECT SUM(
        ROUND(
            CAST(total_sale - (cogs * quantity) AS NUMERIC),
            0
        )
    ) AS total_profit
FROM retail_sales;
-- Answer: Rs. 4,21,447
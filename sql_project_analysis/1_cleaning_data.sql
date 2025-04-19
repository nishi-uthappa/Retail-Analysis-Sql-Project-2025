-- Deleting Null Values as they serve no purpose in our analysis of this particular data -- 
DELETE FROM retail_sales
WHERE transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
SELECT *
FROM retail_sales
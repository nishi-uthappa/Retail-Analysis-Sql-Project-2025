-- Question: Write a query to calculate the average sale for each month to find out the best selling month every year.
WITH MonthlySales AS (
    -- Calculate the total sales for each month
    SELECT EXTRACT(
            YEAR
            FROM sale_date
        ) AS sale_year,
        EXTRACT(
            MONTH
            FROM sale_date
        ) AS sale_month,
        AVG (total_sale) AS average_sale
    FROM retail_sales
    GROUP BY sale_year,
        sale_month
),
RankedSales AS (
    -- Rank months within each year by total sales
    SELECT sale_year,
        sale_month,
        average_sale,
        RANK() OVER (
            PARTITION BY sale_year
            ORDER BY average_sale DESC
        ) AS rank_num
    FROM MonthlySales
) -- Select the top-ranked month for each year
SELECT sale_year,
    sale_month,
    average_sale
FROM RankedSales
WHERE rank_num = 1
ORDER BY sale_year,
    sale_month;
--Re-writing this more concisely
SELECT sale_year,
    sale_month,
    average_sale
FROM (
        SELECT EXTRACT(
                YEAR
                FROM sale_date
            ) AS sale_year,
            EXTRACT(
                MONTH
                FROM sale_date
            ) AS sale_month,
            AVG(total_sale) AS average_sale,
            RANK() OVER (
                PARTITION BY EXTRACT(
                    YEAR
                    FROM sale_date
                )
                ORDER BY AVG(total_sale) DESC
            ) AS rank_num
        FROM retail_sales
        GROUP BY EXTRACT(
                YEAR
                FROM sale_date
            ),
            EXTRACT(
                MONTH
                FROM sale_date
            )
    ) AS RankedSales
WHERE rank_num = 1
ORDER BY sale_year,
    sale_month;
/* Answer: Month 7 is the best performing month in the year 2022,
 while Month 2 is the best performing month in the year 2023
 */
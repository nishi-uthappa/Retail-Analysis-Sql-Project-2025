/* Question: Retreieve all transaction where the category is 'clothing' and the quantity sold is more
 than 3 in the month of November 2022.
 */
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
    AND quantity > 3
    AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';
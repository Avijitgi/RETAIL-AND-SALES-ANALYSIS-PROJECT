create database retail_analytics;
use retail_analytics;

select * from retail_sales_cleaned;

select sum(Revenue) as Total_Revenue from retail_sales_cleaned;
select count(distinct transactions_id) as Total_order from retail_sales_cleaned;
select count(distinct customer_id) as Total_Customer from retail_sales_cleaned;

SELECT category, SUM(Revenue) AS Total_Revenue
FROM retail_sales_cleaned
GROUP BY category
ORDER BY Total_Revenue DESC
Limit 2;

SELECT customer_id,
       SUM(Revenue) AS Revenue
FROM retail_sales_cleaned
GROUP BY customer_id
ORDER BY Revenue DESC;

select customer_id as customers, (count(transactions_id)) as Top_customers
from retail_sales_cleaned
group by customer_id
order by Top_customers desc;

select monthname(sale_date) as M_onth , sum(Revenue) as Revenue from retail_sales_cleaned
group by M_onth
order by Revenue desc;

select * from(
SELECT 
    customer_id,
    SUM(Revenue) AS Total_Revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(Revenue) DESC
    ) AS Revenue_Rank
FROM retail_sales_cleaned
GROUP BY customer_id) as ranked_customers
where 	Revenue_Rank = 2;

SELECT
    transactions_id,
    sale_date,
    sale_time,
    Revenue,
    SUM(Revenue) OVER (
        ORDER BY sale_date, sale_time, transactions_id
    ) AS Cumulative_Revenue
FROM retail_sales_cleaned;

SELECT COUNT(*) AS Repeat_Customers
FROM (
    SELECT customer_id
    FROM retail_sales_cleaned
    GROUP BY customer_id
    HAVING COUNT(DISTINCT transactions_id) > 1
) AS repeat_customers;

select customer_id , sum(Revenue) as total_Revenue_of_customer from retail_sales_cleaned
group by customer_id
order by total_revenue_of_customer desc
limit 5;

select * from retail_sales_cleaned;










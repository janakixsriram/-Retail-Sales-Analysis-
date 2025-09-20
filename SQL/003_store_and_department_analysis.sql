---Top 10 stores that have the highest sales, and average sales based on location
SELECT store, SUM(weekly_sales) AS total_sales, ROUND(AVG(weekly_sales),2) AS average_sales
FROM clean_sales
GROUP BY store
ORDER BY 2 DESC
LIMIT 10;

---10 Best performing departments
SELECT department, SUM(weekly_sales) AS total_sales
FROM clean_sales
GROUP BY department
ORDER BY 2 DESC
LIMIT 10;
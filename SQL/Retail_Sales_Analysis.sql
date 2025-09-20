---Checking for NULL Values
SELECT COUNT(*)
FROM raw_sales
WHERE store IS NULL OR department IS NULL OR date IS NULL OR weekly_sales IS NULL;

---Check if there are negative values in the weekly_sales column
SELECT *
FROM raw_sales
WHERE weekly_sales <0;

---Check if there are unnecessary duplicates
SELECT store, department, date, COUNT(*) AS counter
FROM raw_sales
GROUP BY store, department, date
HAVING COUNT(*) >1;

---Create a new table for cleaned data from the findings above
CREATE TABLE clean_sales AS 
	SELECT *
	FROM raw_sales
	WHERE weekly_sales >=0;

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

---Sales over time per week to identify trends
SELECT date, SUM(weekly_sales) AS total_sales
FROM clean_sales
GROUP BY date
ORDER BY date;

--Sales grouped into months and partitioned by year, with sub-total per year and grand total
SELECT COALESCE(TO_CHAR(TO_DATE(EXTRACT('Month' FROM date)::TEXT, 'MM'),'Month'), 'All Months') AS month, 
	COALESCE(TO_CHAR(EXTRACT('Year' FROM date), '9999'), 'Grand Total') AS year, 
	SUM(weekly_sales) AS total_sales
FROM clean_sales
GROUP BY ROLLUP(EXTRACT('Year' FROM date), EXTRACT('Month' FROM date))
ORDER BY year, EXTRACT('Month' FROM date);


---Holiday vs Non-Holiday Sales
SELECT CASE WHEN is_holiday = True THEN 'holiday'
		ELSE 'non-holiday' END AS is_holiday,
		COUNT(*) AS no_of_weeks,
		SUM(weekly_sales) AS total_sales,
		ROUND(AVG(weekly_sales),2) AS average_sales
FROM clean_sales
GROUP BY is_holiday;


--- Profitable stores based on store type and its average weekly sales
SELECT st.type AS store_stype, COUNT(*) AS no_of_stores, SUM(cs.weekly_sales) AS total_sales, ROUND(AVG(cs.weekly_sales),2) AS average_sales
FROM stores AS st
INNER JOIN clean_sales AS cs USING(store)
GROUP BY st.type
ORDER BY total_sales DESC, average_sales DESC;

---Store performance based on its size and ranked by sales performance
SELECT st.store, st.size,
	CASE WHEN st.size >= 150000 THEN 'Large'
		WHEN st.size BETWEEN 100000 AND 150000 THEN 'Medium'
		ELSE 'Small' END AS store_size_category,
	SUM(cs.weekly_sales) AS total_sales,
	RANK () OVER(ORDER BY SUM(cs.weekly_sales) DESC) AS store_rank
FROM stores AS st
INNER JOIN clean_sales AS cs USING(store)
GROUP BY st.store,st.size,store_size_category
ORDER BY total_sales DESC;

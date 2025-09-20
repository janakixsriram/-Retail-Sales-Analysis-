--- Profitable stores based on store type and its average weekly sales
SELECT st.type AS store_stype, COUNT(*) AS no_of_stores, SUM(cs.weekly_sales) AS total_sales, ROUND(AVG(cs.weekly_sales),2) AS average_sales
FROM stores AS st
INNER JOIN clean_sales AS cs USING(store)
GROUP BY st.type
ORDER BY total_sales DESC, average_sales DESC;

---Store performance based on its size and ranked by total sales performance
SELECT st.store, st.size,
	CASE WHEN st.size >= 150000 THEN 'Large'
		WHEN st.size BETWEEN 100000 AND 150000 THEN 'Medium'
		ELSE 'Small' END AS store_size_category,
	SUM(cs.weekly_sales) AS total_sales,
	AVG(cs.weekly_sales) AS average_sales,
	RANK () OVER(ORDER BY SUM(cs.weekly_sales) DESC) AS store_rank
FROM stores AS st
INNER JOIN clean_sales AS cs USING(store)
GROUP BY st.store,st.size,store_size_category
ORDER BY total_sales DESC;

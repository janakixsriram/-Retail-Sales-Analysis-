---Sales over time per week to identify trends
SELECT date, SUM(weekly_sales) AS total_sales
FROM clean_sales
GROUP BY date
ORDER BY date;

--Sales grouped into months and partitioned by year, with sub-total per year and grand total
SELECT 
	COALESCE(TO_CHAR(TO_DATE(EXTRACT('Month' FROM date)::TEXT, 'MM'),'Month'), 'All Months') AS month, 
	COALESCE(TO_CHAR(EXTRACT('Year' FROM date), '9999'), 'Grand Total') AS year, 
	SUM(weekly_sales) AS total_sales
FROM clean_sales
GROUP BY ROLLUP(EXTRACT('Year' FROM date), EXTRACT('Month' FROM date))
ORDER BY year, EXTRACT('Month' FROM date);
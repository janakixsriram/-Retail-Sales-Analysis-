---Holiday vs Non-Holiday Sales
SELECT CASE WHEN is_holiday = True THEN 'holiday'
		ELSE 'non-holiday' END AS is_holiday,
		COUNT(*) AS no_of_weeks,
		SUM(weekly_sales) AS total_sales,
		ROUND(AVG(weekly_sales),2) AS average_sales
FROM clean_sales
GROUP BY is_holiday;

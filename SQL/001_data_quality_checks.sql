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
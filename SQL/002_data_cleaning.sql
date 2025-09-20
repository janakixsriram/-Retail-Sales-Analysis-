---Create a new table for cleaned data from the findings above
CREATE TABLE clean_sales AS 
	SELECT *
	FROM raw_sales
	WHERE weekly_sales >=0;
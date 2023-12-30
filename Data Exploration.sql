/* Data Exploration for Tableau */

-- Checking the size of table
SELECT count(*) FROM sales_data sd 

-- Check whether there is missing data

SELECT *
FROM sales_data sd
WHERE 
	event_time is null or
	event_type is null or
	product_id is null or
	category_id is null or
	category_code is null or
	brand is null or
	price is null or
	user_id is null

-- Checking empty values in brand
	
SELECT count(*)
FROM sales_data sd 
WHERE brand = ''

-- Checking empty values in category_code

SELECT count(*)
FROM sales_data sd 
WHERE category_code = ''

-- Checking distinct values for event type

SELECT distinct(event_type)
FROM sales_data sd

-- Calculating purchase conversion rate

SELECT (count(*) / (SELECT count(*) FROM sales_data sd)) * 100 as purchase_conversion_rate
FROM sales_data sd2
WHERE event_type = 'purchase'

-- Checking the period of dataset

SELECT min(event_time), max(event_time)
FROM sales_data sd

-- Top 5 Brands

SELECT brand, count(*) as purchase_count
FROM sales_data sd 
WHERE 
	event_type = 'purchase' and
	brand <> ''
GROUP BY brand
ORDER BY purchase_count DESC
LIMIT 5

-- Top 5 categories
SELECT category_code , count(*) as purchase_count
FROM sales_data sd 
WHERE 
	event_type = 'purchase' and
	category_code <> ''
GROUP BY category_code 
ORDER BY purchase_count DESC
LIMIT 5

-- Checking total number of purchases
SELECT count(*) as total_purchases
FROM sales_data sd 
WHERE event_type = 'purchase'

-- Checking overall AOV (Average Order Value)

SELECT sum(price) / count(*) as AOV
FROM sales_data sd
WHERE event_type = 'purchase'

-- Checking Funnel Conversion Rates (view -> cart)

With event_view as
(
	SELECT product_id
	FROM sales_data sd 
	WHERE event_type = 'view'
)
SELECT count(sd2.product_id) / (SELECT count(ev.product_id) FROM ev)
FROM sales_data sd2 JOIN event_view ev on sd2.product_id = ev.product_id
WHERE sd2.event_type = 'cart'

-- Checking Funnel Conversion Rates (cart -> purchase)

With event_cart as
(
	SELECT product_id
	FROM sales_data sd 
	WHERE event_type = 'cart'
)
SELECT count(sd2.product_id) / (SELECT count(ec.product_id) FROM ec)
FROM sales_data sd2 join event_cart ec on sd2.product_id = ec.product_id
WHERE sd2.event_type = 'purchase'

-- Checking Funnel Conversion Rates (view -> purchase)

With EventView as
(
	SELECT product_id
	FROM sales_data sd 
	WHERE event_type = 'view'
)
SELECT count(sd2.product_id) / (SELECT count(ev.product_id) FROM ev)
FROM EventView ev join sales_data sd2 on sd2.product_id = CTE.product_id
WHERE sd2.event_type = 'purchase'


-- Cohort Analysis of users that purcahsed on first month (September)

WITH UserCohorts AS (
    SELECT
        user_id
    FROM
        sales_data
    WHERE
        event_type = 'purchase' and
        MONTH(event_time) = (SELECT MONTH(MIN(event_time)) FROM sales_data sd2)
)
SELECT
    MONTH(sd.event_time) AS event_month,
    COUNT(DISTINCT sd.user_id) AS user_count
FROM
    UserCohorts uc
JOIN
    sales_data sd ON uc.user_id = sd.user_id
GROUP BY
    MONTH(sd.event_time)
ORDER BY
    MONTH(sd.event_time);

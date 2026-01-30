USE ecommerce_analytics;

SELECT ROUND(SUM(quantity * price), 2) AS total_revenue
FROM clean_online_retail_v2
WHERE is_cancelled = 0;

SELECT
    YEAR(invoice_datetime) AS year,
    MONTH(invoice_datetime) AS month,
    ROUND(SUM(quantity * price), 2) AS monthly_revenue
FROM clean_online_retail_v2
WHERE is_cancelled = 0
GROUP BY YEAR(invoice_datetime), MONTH(invoice_datetime)
ORDER BY year, month;

SELECT
    stock_code,
    description,
    ROUND(SUM(quantity * price), 2) AS product_revenue
FROM clean_online_retail_v2
WHERE is_cancelled = 0
GROUP BY stock_code, description
ORDER BY product_revenue DESC
LIMIT 10;

SELECT
    customer_id,
    ROUND(SUM(quantity * price), 2) AS customer_revenue
FROM clean_online_retail_v2
WHERE is_cancelled = 0
  AND customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY customer_revenue DESC
LIMIT 10;

SELECT
    country,
    ROUND(SUM(quantity * price), 2) AS country_revenue
FROM clean_online_retail_v2
WHERE is_cancelled = 0
GROUP BY country
ORDER BY country_revenue DESC;

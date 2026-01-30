USE ecommerce_analytics;

ALTER TABLE raw_online_retail
ADD invoice_datetime DATETIME;

SET SQL_SAFE_UPDATES = 0;

UPDATE raw_online_retail
SET invoice_datetime = STR_TO_DATE(invoice_date, '%d-%m-%Y %H:%i')
WHERE invoice_datetime IS NULL
LIMIT 10000;

SET SQL_SAFE_UPDATES = 1;

DROP TABLE IF EXISTS clean_online_retail_v2;

CREATE TABLE clean_online_retail_v2 AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    price,
    customer_id,
    country,
    invoice_datetime,
    CASE WHEN invoice_no LIKE 'C%' THEN 1 ELSE 0 END AS is_cancelled
FROM raw_online_retail
WHERE price > 0;

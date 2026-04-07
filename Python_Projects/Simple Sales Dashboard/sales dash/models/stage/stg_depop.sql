SELECT 
PARSE_TIMESTAMP('%m/%d/%Y %I:%M %p', CONCAT(`Date of sale`, ' ', `Time of sale`)) AS date_of_sale,
PARSE_DATE('%m/%d/%Y', `Date of Listing`) AS list_date,
`Buyer`,
`Brand`,
`Description`,
`Size`,
CASE WHEN TRIM(`Item price`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`Item price`), '$', '') AS NUMERIC) 
END AS item_price,
CASE WHEN TRIM(`Buyer Shipping cost`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`Buyer Shipping cost`), '$', '') AS NUMERIC) 
END AS buyer_shipping_cost,
CASE WHEN TRIM(`USPS Cost`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`USPS Cost`), '$', '') AS NUMERIC) 
END AS usps_cost,
CASE WHEN TRIM(`Depop fee`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`Depop fee`), '$', '') AS NUMERIC) 
END AS depop_fee,
CASE WHEN TRIM(`Depop Payments fee`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`Depop Payments fee`), '$', '') AS NUMERIC) 
END AS depop_payments_fee,
CASE WHEN TRIM(`Boosting fee`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`Boosting fee`), '$', '') AS NUMERIC) 
END AS boosting_fee,
CASE WHEN TRIM(`Buyer marketplace fee`) = '-' THEN 0 
     ELSE CAST(REPLACE(TRIM(`Buyer marketplace fee`), '$', '') AS NUMERIC) 
END AS buyer_marketplace_fee,
`Payment type`,
PARSE_DATE('%m/%d/%Y', `Estimated payout Date`) AS estimated_payout_date,
PARSE_DATE('%m/%d/%Y', `Payout arrival date`) AS payout_arrival_date,
`Category`,
`Name`,
`State`,
CASE WHEN TRIM(`US Sales tax`) = '-' THEN NULL 
     ELSE CAST(REPLACE(TRIM(`US Sales tax`), '$', '') AS NUMERIC) 
END AS us_sales_tax,
`Refunded to buyer amount`,
`Fees refunded to seller`
FROM {{ source('depop', 'depop_data_raw') }}
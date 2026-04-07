SELECT 
    date_of_sale,
    buyer,
    item_price,
    (usps_cost + depop_fee + depop_payments_fee + boosting_fee + buyer_marketplace_fee) AS total_fees,
    us_sales_tax,
    (item_price - usps_cost - depop_fee - depop_payments_fee - boosting_fee - buyer_marketplace_fee) AS net_payout,
    category,
    Brand
FROM {{ ref('stg_depop') }}




-- # things to look for 

-- profit based on category,
-- total fees.
-- total refunds

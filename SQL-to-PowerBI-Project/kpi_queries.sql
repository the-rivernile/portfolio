/* ============================================================
   KPI 1: Average user rating
   ============================================================ */
SELECT app_name, ROUND(AVG(rating),1) AS avg_user_rating
FROM reviews
GROUP BY app_name
ORDER BY avg_user_rating DESC;


/* ============================================================
   KPI 2: Number of users who left a review
   ============================================================ */
SELECT COUNT(DISTINCT(user_id)) AS user_id
FROM reviews
WHERE review_text IS NOT NULL;
/* ============================================================
   KPI 1: total apps reveiwed
   ============================================================ */
SELECT COUNT(DISTINCT(app_name))
FROM reviews
WHERE review_text IS NOT NULL;

/* ============================================================
   Clustered Bar chart 
   ============================================================ */
SELECT app_name, verified_purchase, ROUND(AVG(rating),1) AS avg_user_rating  
FROM reviews
GROUP BY app_name, verified_purchase
ORDER BY avg_user_rating DESC;

/* ============================================================
     Map
   ============================================================ */
SELECT 
user_country, 
COUNT(*) AS user_count
FROM reviews
GROUP BY user_country 
ORDER BY user_count DESC;

/* ============================================================
     Stacked Bar Chart
   ============================================================ */

SELECT app_name, ROUND(AVG(num_helpful_votes),2) as AVG_HELPFUL_REVIEWS_BY_APP
FROM reviews
GROUP BY app_name
ORDER BY  AVG_HELPFUL_REVIEWS_BY_APP DESC;

/* ============================================================
     other helpful queries
   ============================================================ */

 /*  users based by gender */
user_gender, 
COUNT(*) AS user_gender_count
FROM reviews
WHERE user_gender IS NOT NULL
GROUP BY user_gender 
ORDER BY user_gender_count DESC;
 /*  number of reviews based on language */

SELECT review_language, COUNT(review_language) AS Num_lang_reviews 
FROM reviews
GROUP BY review_language
ORDER BY NUM_lang_reviews  DESC;

 /*  ratings by month  */
SELECT 
    DATE_TRUNC('month', review_date) AS review_month,
    ROUND(AVG(rating), 2) AS avg_rating
FROM reviews
GROUP BY DATE_TRUNC('month', review_date)
ORDER BY review_month;


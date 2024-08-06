select * from customers;

select * from stores;

select * from products;

select * from sales;


#c.gender
SELECT 
    c."Gender",
    COUNT(*) AS total_customers
FROM 
    customers c
GROUP BY 
    c."Gender";

#c.age
SELECT 
    CASE 
        WHEN age BETWEEN 0 AND 9 THEN '0-9'
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        WHEN age BETWEEN 70 AND 79 THEN '70-79'
        ELSE '80+'  -- For ages 80 and above
    END AS age_range,
    COUNT(*) AS customer_count
FROM 
    customers
GROUP BY 
    age_range
ORDER BY 
    MIN(age); 


#c.state
SELECT 
    "State",
    COUNT(*) AS customer_count
FROM 
    customers
GROUP BY 
    "State"
ORDER BY 
    customer_count DESC;

#s.trends
SELECT 
    EXTRACT(YEAR FROM s."Date") AS year,
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue
FROM 
    sales s
GROUP BY 
    year
ORDER BY 
    year;

#s.top
SELECT 
    p."ProductKey",
    p."Product Name",
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue
FROM 
    sales s
JOIN 
    products p ON s."ProductKey" = p."ProductKey"
GROUP BY 
    p."ProductKey", p."Product Name"
ORDER BY 
    total_quantity_sold DESC;

#s.currency
SELECT 
    p."ProductKey",
    p."Product Name",
    s."Currency",
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue_in_original_currency,
    SUM(s."Quantity" * s."unit_price_local" * s."Exchange") AS total_revenue_in_usd
FROM 
    sales s
JOIN 
    products p ON s."ProductKey" = p."ProductKey"
GROUP BY 
    p."ProductKey", p."Product Name", s."Currency"
ORDER BY 
    total_revenue_in_usd DESC;

#p.profit
SELECT 
    p."ProductKey",
    p."Product Name",
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue,
    SUM(s."Quantity" * p."Unit Cost USD") AS total_cost,
    SUM(s."Quantity" * s."unit_price_local") - SUM(s."Quantity" * p."Unit Cost USD") AS total_profit
FROM 
    sales s
JOIN 
    products p ON s."ProductKey" = p."ProductKey"

GROUP BY 
    p."ProductKey", p."Product Name"
ORDER BY 
    total_profit DESC;

#p.category
SELECT 
    p."Category",
    p."Subcategory",
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue,
    SUM(s."Quantity" * s."Unit Cost USD") AS total_cost,
    SUM(s."Quantity" * s."unit_price_local") - SUM(s."Quantity" * s."Unit Cost USD") AS total_profit
FROM 
    sales s
JOIN 
    products p ON s."ProductKey" = p."ProductKey"
GROUP BY 
    p."Category", p."Subcategory"
ORDER BY 
    total_revenue DESC;

#st.performance
SELECT 
    st."StoreKey",
  
    st."Square Meters" AS size_sqm,
    st."Open Date",
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue,
   
    SUM(s."Quantity" * s."unit_price_local") / st."Square Meters" AS revenue_per_sqm,
   
    DATE_PART('year', AGE(CURRENT_DATE, st."Open Date")) AS years_operational,
    SUM(s."Quantity" * s."unit_price_local") / DATE_PART('year', AGE(CURRENT_DATE, st."Open Date")) AS annual_revenue
FROM 
    sales s
JOIN 
    stores st ON s."StoreKey" = st."StoreKey"
GROUP BY 
    st."StoreKey", st."Square Meters", st."Open Date"
ORDER BY 
    total_revenue DESC;

#st.sales
SELECT 
    
    st."State",
    st."Country",
    SUM(s."Quantity") AS total_quantity_sold,
    SUM(s."Quantity" * s."unit_price_local") AS total_revenue,
    COUNT(DISTINCT st."StoreKey") AS total_stores,
    SUM(s."Quantity" * s."unit_price_local") / COUNT(DISTINCT st."StoreKey") AS avg_revenue_per_store
FROM 
    sales s
JOIN 
    stores st ON s."StoreKey" = st."StoreKey"
GROUP BY 
    st."State", st."Country"
ORDER BY 
    total_revenue DESC;
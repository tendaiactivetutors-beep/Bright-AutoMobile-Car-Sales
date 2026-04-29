select * from `workspace`.`default`.`bright_auto_mobile_car_sales` limit 100;

-----------------------------------------------------------------------------------------------------
--GENERAL CHECKS
SELECT MIN (Model_Year)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

-----------------------------------------------------------------------------------------------------

SELECT MAX (Model_Year)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;
-----------------------------------------------------------------------------------------------------------

SELECT DISTINCT (MAKE)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

----------------------------------------------------------------------------------------------------------

SELECT DISTINCT (MODEL)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

-----------------------------------------------------------------------------------------------------
SELECT DISTINCT (TRIM)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

-----------------------------------------------------------------------------------------------------
SELECT DISTINCT (STATE)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;
------------------------------------------------------------------------------------------------------

SELECT DISTINCT (ODOMETER)
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

------------------------------------------------------------------------------------------------------

-- REPLACING NULL with None

SELECT 
  IFNULL(Model_Year, 0) AS Model_Year,
  IFNULL(MAKE, 'None') AS MAKE,
  IFNULL(MODEL, 'None') AS MODEL,
  IFNULL(TRIM, 'None') AS TRIM,
  IFNULL(BODY, 'None') AS BODY,
  IFNULL(TRANSMISSION, 'None') AS TRANSMISSION,
  IFNULL(VIN, 'None') AS VIN,
  IFNULL(STATE, 'None') AS STATE,
  IFNULL(CONDITION, 0) AS CONDITION,
  IFNULL(ODOMETER, 0) AS ODOMETER,
  IFNULL(COLOR, 'None') AS COLOR,
  IFNULL(INTERIOR, 'None') AS INTERIOR,
  IFNULL(SELLER, 'None') AS SELLER
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`  
WHERE TRY_CAST(COST_PRICE AS DOUBLE) IS NULL
  AND COST_PRICE IS NOT NULL;

-----------------------------------------------------------------------------------------------------
--Profit_Margin = (Selling_Price - Cost_Price) / Selling_Price * 100 AND categorize cars by performance tiers (e.g., High Margin, Medium Margin, Low Margin).
SELECT 
  IFNULL(Model_Year, 0) AS Model_Year,
  IFNULL(MAKE, 'None') AS MAKE,
  IFNULL(MODEL, 'None') AS MODEL,
  SUM(TRY_CAST(COST_PRICE AS DOUBLE)) AS COST_PRICE,
  COUNT(*) AS UNITS_SOLD,
  ROUND ((SUM(TRY_CAST(COST_PRICE AS DOUBLE)) - SUM(TRY_CAST(COST_PRICE AS DOUBLE))) / SUM(TRY_CAST(COST_PRICE AS DOUBLE)) * 100, 2) AS PROFIT_MARGIN,
  CASE
    WHEN ROUND ((SUM(TRY_CAST(COST_PRICE AS DOUBLE)) - SUM(TRY_CAST(COST_PRICE AS DOUBLE))) / SUM(TRY_CAST(COST_PRICE AS DOUBLE)) * 100, 2) BETWEEN 0 AND 24.99 THEN 'Low Margin'
    WHEN ROUND ((SUM(TRY_CAST(COST_PRICE AS DOUBLE)) - SUM(TRY_CAST(COST_PRICE AS DOUBLE))) / SUM(TRY_CAST(COST_PRICE AS DOUBLE)) * 100, 2) BETWEEN 25 AND 49.99 THEN 'Medium Margin'
    WHEN ROUND ((SUM(TRY_CAST(COST_PRICE AS DOUBLE)) - SUM(TRY_CAST(COST_PRICE AS DOUBLE))) / SUM(TRY_CAST(COST_PRICE AS DOUBLE)) * 100, 2) >= 50 THEN 'High Margin'
    ELSE 'Negative Margin'
  END AS PERFORMANCE_TIER
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`
GROUP BY Model_Year, MAKE, MODEL;
-----------------------------------------------------------------------------------------------------
---Performance Tier

SELECT *,
CASE 
    WHEN TRY_CAST(COST_PRICE AS DOUBLE) >= 40000 THEN 'High Margin'
    WHEN TRY_CAST(COST_PRICE AS DOUBLE) BETWEEN 20000 AND 39999 THEN 'Medium Margin'
    ELSE 'Low Margin'
END AS margin_category
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

-----------------------------------------------------------------------------------------------------
---Time Aggregation

SELECT 
    Model_Year AS year,
    SUM(TRY_CAST(COST_PRICE AS DOUBLE)) AS revenue,
    COUNT(*) AS units_sold
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`
GROUP BY Model_Year
ORDER BY Model_Year;

-----------------------------------------------------------------------------------------------------
---Top Revenue Cars
SELECT 
    make,
    model,
     SUM(TRY_CAST(COST_PRICE AS DOUBLE)) AS revenue
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`
GROUP BY make, model
ORDER BY revenue DESC;

-----------------------------------------------------------------------------------------------------

---Regional Performance

SELECT 
    State,
    COUNT(*) AS total_sales,
     SUM(TRY_CAST(COST_PRICE AS DOUBLE)) AS revenue
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`
GROUP BY state
ORDER BY revenue DESC;

-----------------------------------------------------------------------------------------------------

---Price vs Mileage vs Year

SELECT 
    TRY_CAST(Model_Year AS INT) AS Model_Year,
    AVG(TRY_CAST(Cost_Price AS DOUBLE)) AS avg_price,
    AVG(TRY_CAST(Odometer AS DOUBLE)) AS avg_mileage
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`
WHERE Model_Year IS NOT NULL
GROUP BY Model_Year
ORDER BY Model_Year DESC;

-----------------------------------------------------------------------------------------------------
---Big Query for Dashboard

SELECT 
    VIN,
    Make, 
    Model, 
    Trim, 
    Body, 
    Model_Year,
    YEAR(CURRENT_DATE) - Model_Year AS Vehicle_Age,
    Transmission, 
    Color, 
    Interior, 
    Condition,
    Odometer,
    CASE 
        WHEN TRY_CAST(Odometer AS DOUBLE) < 20000 THEN 'Low Mileage'
        WHEN TRY_CAST(Odometer AS DOUBLE) BETWEEN 20000 AND 80000 THEN 'Medium Mileage'
        ELSE 'High Mileage'
    END AS Mileage_Band_Category,
    Mileage_Band,
    State, 
    Seller,
    Cost_Price,
    CASE 
        WHEN TRY_CAST(Cost_Price AS DOUBLE) >= 40000 THEN 'High Value'
        WHEN TRY_CAST(Cost_Price AS DOUBLE) >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Value_Tier
FROM `workspace`.`default`.`bright_auto_mobile_car_sales`;

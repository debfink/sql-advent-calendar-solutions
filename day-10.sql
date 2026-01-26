-- SQL Advent Calendar - Day 10
-- Title: Cookie Factory Oven Efficiency
-- Difficulty: easy
--
-- Question:
-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?
--
-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?
--

-- Table Schema:
-- Table: cookie_batches
--   batch_id: INT
--   oven_id: INT
--   baking_time_minutes: DECIMAL
--

-- My Solution:

SELECT oven_id, 
        batch_id, 
        baking_time_minutes, 
        sum(baking_time_minutes) OVER (PARTITION BY oven_id) AS total_baking_time,
        COUNT(batch_id) OVER (PARTITION BY oven_id) AS total_batches,
        round((sum(baking_time_minutes) OVER (PARTITION BY oven_id) )
        / (COUNT(batch_id) OVER (PARTITION BY oven_id) ),1) as Average_baking_time
FROM cookie_batches
GROUP BY oven_id,batch_id

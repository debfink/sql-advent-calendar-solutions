-- SQL Advent Calendar - Day 24
-- Title: New Year Goals - User Type Analysis
-- Difficulty: hard
--
-- Question:
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--

-- Table Schema:
-- Table: user_goals
--   user_id: INT
--   user_type: VARCHAR
--   goal_id: INT
--   goal_status: VARCHAR
--

-- My Solution:

WITH comp_goals_per_user AS
  (SELECT 
    user_id,
    user_type,
    --goal_status,
    SUM(IIF(goal_status='Completed',1,0)) as total_completed
  FROM user_goals
  GROUP BY user_id, user_type) 
SELECT 
  user_type,
  AVG(total_completed)
FROM comp_goals_per_user
GROUP BY user_type
--WHERE goal_status = "Completed"

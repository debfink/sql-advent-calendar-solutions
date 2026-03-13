-- SQL Advent Calendar - Day 20
-- Title: Hot Cocoa Break Logs
-- Difficulty: medium
--
-- Question:
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--

-- Table Schema:
-- Table: cocoa_logs
--   log_id: INT
--   break_id: INT
--   cocoa_id: INT
--
-- Table: break_schedule
--   break_id: INT
--   location_id: INT
--
-- Table: cocoa_types
--   cocoa_id: INT
--   cocoa_name: VARCHAR
--
-- Table: locations
--   location_id: INT
--   location_name: VARCHAR
--

-- My Solution:

WITH full_cocoa_log as (
SELECT 
  coc.log_id, 
  coc.break_id,
  coc.cocoa_id,
  bs.location_id,
  cn.cocoa_name,
  loc.location_name
  
FROM cocoa_logs coc
JOIN break_schedule bs
  ON bs.break_id = coc.break_id
JOIN cocoa_types cn
  ON cn.cocoa_id = coc.cocoa_id
JOIN locations loc
  ON bs.location_id = loc.location_id
  )
SELECT * from full_cocoa_log

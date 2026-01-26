-- SQL Advent Calendar - Day 15
-- Title: The Grinch's Mischief Tracker
-- Difficulty: hard
--
-- Question:
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--

-- Table Schema:
-- Table: grinch_mischief_log
--   log_date: DATE
--   mischief_score: INTEGER
--

-- My Solution:

with date_lag_data as(
  select 
    log_date,
    mischief_score,
    LAG (mischief_score,1,0) OVER (ORDER BY log_date) prev_day_score
  FROM
      grinch_mischief_log
  )
SELECT
  log_date,
  mischief_score,
  prev_day_score,
  mischief_score - prev_day_score as variance
  from date_lag_data
group by log_date
order by log_date asc

-- SQL Advent Calendar - Day 22
-- Title: Penguin Sleigh Ride Filter
-- Difficulty: easy
--
-- Question:
-- The penguins are signing up for a community sleigh ride, but the organizers need a list of everyone who did NOT choose the "Evening Ride." How would you return all penguins whose selected time is not the evening slot?
--
-- The penguins are signing up for a community sleigh ride, but the organizers need a list of everyone who did NOT choose the "Evening Ride." How would you return all penguins whose selected time is not the evening slot?
--

-- Table Schema:
-- Table: sleigh_ride_signups
--   signup_id: INT
--   penguin_name: VARCHAR
--   ride_time: VARCHAR
--

-- My Solution:

WITH morn_aft as(
SELECT 
  penguin_name,
  signup_id,
  ride_time,
  IIF(ride_time!= 'Evening', 1, 0) as mark
FROM sleigh_ride_signups
ORDER BY penguin_name )
SELECT * 
  FROM morn_aft
WHERE mark != 0

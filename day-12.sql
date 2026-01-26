-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

--create a CTE table to find the information that we need to perform the ranking
WITH daily_counts AS (
  SELECT
    date(nm.sent_at) AS sent_date  -- convert from date/time to day
    ,nu.user_id
    ,nu.user_name
    ,COUNT(nm.message_id) AS message_count -- count messages per sender 
  FROM npn_users nu
  JOIN npn_messages nm 
    on nu.user_id = nm.sender_id  -- Join messages to users
    GROUP BY 
    sent_date, -- group these by date
    nu.user_id, -- group these by user
    nu.user_name
),
-- pick the top senders by day
-- using rank instead of row number to show ALL top senders if tied
ranked_senders AS (
  SELECT
  *,
  RANK() OVER (  
    PARTITION BY sent_date -- restart the ranking every day
    ORDER BY message_count DESC
  ) AS rn 
  FROM daily_counts
)
SELECT
  sent_date,
  user_id,
  user_name,
  message_count
FROM ranked_senders
WHERE rn = 1;  -- only return top ranked senders per day

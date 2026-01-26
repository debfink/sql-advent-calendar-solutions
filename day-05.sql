-- SQL Advent Calendar - Day 5
-- Title: Elf Vacation Status
-- Difficulty: medium
--
-- Question:
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--

-- Table Schema:
-- Table: elves
--   elf_id: INT
--   elf_name: VARCHAR
--
-- Table: vacations
--   elf_id: INT
--   start_date: DATE
--   return_date: DATE
--

-- My Solution:

--select el.elf_name, start_date, coalesce(v.return_date, "Still resting")
--from elves el
--FULL JOIN vacations v ON el.elf_id = v.elf_id
--ORDER BY el.elf_name asc, start_date desc

select elf_name, coalesce(return_date, "Still resting")
from (
      SELECT
        el.elf_id,
        elf_name,
        start_date,
        return_date,
        RANK() OVER (
                      PARTITION BY el.elf_id, elf_name
                      ORDER BY elf_name asc, start_date DESC
                      ) AS holrank
      FROM elves el
      FULL JOIN vacations v ON el.elf_id = v.elf_id
      )
  where holrank = 1

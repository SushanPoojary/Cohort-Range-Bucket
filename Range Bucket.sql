WITH Cohort AS (
SELECT
  DISTINCT id,
  reputation
FROM
  `bigquery-public-data.stackoverflow.users`
)
SELECT RANGE_BUCKET(reputation, [2, 11, 26, 51, 101, 251, 501, 1001, 2001, 5001, 10001]) AS rep_group, COUNT(*) AS count
    FROM Cohort
    GROUP BY 1
    ORDER BY rep_group
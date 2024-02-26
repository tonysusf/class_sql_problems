-- https://leetcode.com/problems/rank-scores/
-- DB: MySQL
-- https://dev.mysql.com/doc/refman/8.0/en/window-function-descriptions.html#function_dense-rank
-- https://dev.mysql.com/doc/refman/8.0/en/window-function-descriptions.html#function_rank
-- https://dev.mysql.com/doc/refman/8.0/en/window-function-descriptions.html#function_row-number


select
score,
dense_rank() over (order by score desc) as `rank`

from scores
order by score desc
;

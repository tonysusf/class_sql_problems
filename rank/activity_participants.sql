-- https://leetcode.com/problems/activity-participants/
-- DB: MySQL

with tmp as (
    select
        activity,
        rank() over (order by count(id)) as rank_asc,
        rank() over (order by count(id) desc) as rank_desc
    from Friends
    group by activity
)

select
activity

from
tmp

where
rank_asc != 1
and rank_desc != 1

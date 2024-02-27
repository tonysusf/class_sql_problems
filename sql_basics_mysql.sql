--------------------------
-- Date
--------------------------
-- date to string
select date_format(current_date(), '%Y-%m-%d');
select date_format(current_date(), '%Y-%m-%d %H:%i:%s');

-- string to date
select str_to_date('2022-01-15', '%Y-%m-%d');
select str_to_date('2022-01-15 10:00:00', '%Y-%m-%d %H:%i:%s');

-- convert to yyyy-mm format
select date_format(date_col, '%Y-%m') from table;

-- add N days, months or years
select date_add(current_date(), interval 7 day);
select date_add(current_date(), interval 3 month);
select date_add(current_date(), interval 2 year);

-- datediff
select order_id, datediff(delivery_date, order_date) as days_to_deliver from orders;

--------------------------
-- String
--------------------------
-- concat
select concat(first_name, ' ', last_name) from employees;

-- group concat/join
select group_concat(name separator ', ') from employees;


-- upper case lower case, length, substring
select upper('Hell'), lower('Hello');
select length('Hello World');
select substring('Hello World', 1, 5);

-- replace
select replace('apple, banana, cherry', ', ', '|');


--------------------------
-- Aggregation
--------------------------
-- having vs where
select cust_id, sum(total_amount) from orders
where order_date > '2023-01-01'
group by cust_id
having sum(total_amount) > 1000;

-- rank over partition
select student_id, rank() over (partition by class_id order by score desc) as class_rank from students;


-- case when then end
select employee_id,
    case
        when salary >= 100000 then 'High'
        when salary >= 50000 then 'Medium'
        else 'Low'
    end as salary_category
from employees;

-- generate_series via common table expression (CTE)
with recursive numbers AS (
    select 1 as num
    union all
    select num + 1 from numbers WHERE n < 100
)
select num from numbers;




--------------------------
-- Date
--------------------------
-- date to string
select date_format(date_col, '%Y-%m-%d') from table;
select date_format(date_col, '%Y-%m-%d %H:%i:%s') from table;

-- string to date
select str_to_date('2022-01-15', '%Y-%m-%d');
select str_to_date('2022-01-15 10:00:00', '%Y-%m-%d %H:%i:%s');

-- convert to yyyy-mm format
select date_format(date_col, '%Y-%m') from table;

-- add N days, months or years
select date_add(date_col, interval 7 day) from table;
select date_add(date_col, interval 3 month) from table;
select date_add(date_col, interval 2 year) from table;

-- datediff
select order_id, datediff(delivery_date, order_date) as days_to_deliver from orders;

--------------------------
-- String
--------------------------
-- concat
select concat(first_name, ' ', last_name) as full_name from employees;

-- upper case lower case
select upper(name), lower(name) from users;

-- string length
select length('Hello World');

-- substring
select substring(description, 11, 20) from products;

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



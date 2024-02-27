--------------------------
-- Date
--------------------------
-- date to string
select date_format(date_col, '%Y-%m-%d') as the_date from table;

-- string to date
select str_to_date('2022-01-15', '%Y-%m-%d') as date_value;

-- convert to yyyy-mm format
select date_format(date_col, '%Y-%m') as the_month from table;

-- add N days, months or years
select date_add(date_col, interval 7 day) AS new_date_col FROM table;
select date_add(date_col, interval 3 month) AS new_date_col FROM table;
select date_add(date_col, interval 2 year) AS new_date_col FROM table;




``` sql
create table raw.jaffle_shop.customers 
( id integer,
  first_name varchar,
 last_name varchar
);
```


``` sql
-- copy into raw.jaffle_shop.customers (id, first_name, last_name)
-- from 's3://dbt-tutorial-public/jaffle_shop_customers.csv'
-- file_format = (
--   type = 'CSV'
--   field_delimiter = ','
--   skip_header = 1
--   );

```

-- select *
-- from raw.jaffle_shop.customers
-- limit 5
-- create table raw.stripe.payment
-- (id integer,
-- orderid integer,
-- paymentmethod varchar,
-- status varchar,
-- amount integer,
-- created date,
-- _batched_at timestamp default current_timestamp
-- );
copy into raw.stripe.payment (id, orderid, paymentmethod, status, amount, created)
from 's3://dbt-tutorial-public/stripe_payments.csv'
file_format = (
  type = 'CSV'
  field_delimiter = ','
  skip_header = 1
  );
  
  
  
-- select * from raw.jaffle_shop.customers;
-- select * from raw.jaffle_shop.orders;
-- select * from raw.stripe.payment;

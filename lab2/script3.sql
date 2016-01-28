/*merge two tables*/

insert into mg_customers (customer_id, first_name, last_name, email, address_id, active)
select dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
from dv_customer;

CREATE SEQUENCE mg_customers_seq START 600;

ALTER TABLE mg_customers ALTER COLUMN customer_id SET DEFAULT NEXTVAL('mg_customers_seq');

/*copy info from cb_customers that is not in dv_customer*/
INSERT INTO mg_customers (first_name, last_name)
SELECT cb_customers.first_name, cb_customers.last_name 
FROM  cb_customers
EXCEPT
SELECT cb.first_name, cb.last_name
FROM cb_customers cb, dv_customer dv
WHERE cb.first_name=dv.first_name AND cb.last_name=dv.last_name;


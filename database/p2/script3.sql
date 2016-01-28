/*inserting the dv_cusomter informations into mg_customers table*/
insert into mg_customers (customer_id, first_name, last_name, email, address_id, active)
select dv_customer.customer_id, dv_customer.first_name, dv_customer.last_name, dv_customer.email, dv_customer.address_id, dv_customer.active
from dv_customer;

/*create the sequence and increment it ad customer_id to customers from cb_customers*/
create sequence mg_customers_seq start 600;
alter table mg_customers
alter column customer_id
set default nextval('mg_customers_seq');
insert into mg_customers (last_name, first_name)
select cb_customers.last_name, cb_customers.first_name
/*the following script sees if cb_customers already exist in mg_customers from the prior insert*/
from cb_customers
except
select mg_customers.last_name, mg_customers.first_name
from mg_customers;

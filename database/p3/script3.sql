/*constraint for positive and none zero length*/
alter table dv_film
add constraint positive_length check(length > 0);

/*check for exisitng null and replace with 1*/
update mg_customers
set address_id = 1
where address_id is null;

/*enforce none null constraint for address_id*/
alter table mg_customers
add constraint valid_addressid check(address_id is not null);

/*enforce none null constraint for address*/
alter table dv_address
add constraint valid_address check(address is not null);

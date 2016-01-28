/*delete invokes the foreign key 1 that is being used therefore
causing errors*/
delete from dv_address
where address_id = 1;

delete from cb_authors
where author_id = 1;

/*a legit row is being created with valid primary and/or foreign id or valid
length for film or address*/
insert into dv_film
(film_id, title, description, length, rating)
values
(1001, 'Madlife', 'a guy that plays Thresh', 100, 'G');

insert into mg_customers
(customer_id, address_id)
values
(651, 1);

insert into dv_address
(address_id, address)
values
(1001, '1918 Donner Ave');

/*invalid rows either with no film length/address, no primary/foreign key*/
insert into dv_film
(film_id, length)
values
(1002, 0);

insert into mg_customers
(customer_id, address_id)
values
(652, null);

insert into dv_address
(address_id, address)
values
(1002, null);

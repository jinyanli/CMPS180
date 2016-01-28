/*set appropriate primary key to each
table according to instruction*/
alter table mg_customers
add primary key (customer_id);

alter table dv_address
add primary key (address_id);

alter table dv_film
add primary key (film_id);

alter table cb_books
add constraint books_key primary key (title, author_id);

alter table cb_authors
add primary key (author_id);

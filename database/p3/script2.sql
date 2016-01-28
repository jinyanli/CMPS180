/*add foreign key address_id to mg_customers*/
alter table mg_customers
add foreign key(address_id)
references dv_address(address_id);

/*add foreign key author_id to cb_books*/
alter table cb_books
add foreign key(author_id)
references cb_authors(author_id);

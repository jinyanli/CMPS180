/*It outputs the first names and last names of customers that
intersect in dv_customer and cb_customers*/
select dv_customer.first_name, dv_customer.last_name
from dv_customer
where (dv_customer.first_name, dv_customer.last_name)
in
(select cb_customers.first_name, cb_customers.last_name from cb_customers);



/*Outputs the phone number of customers whose address_id
is in dv_cumsters and that their first last names also appears
in cb_customers table*/
select dv_address.phone
from dv_address
where (dv_address.address_id)
in
(
select dv_customer.address_id
from dv_customer
where (dv_customer.first_name, dv_customer.last_name)
in
(select cb_customers.first_name, cb_customers.last_name from cb_customers)
);



/*outputs the first last name of customers whose address_id
is associated with the district that has the most customers*/
select dv_customer.first_name, dv_customer.last_name
from dv_customer
where (dv_customer.address_id)
in
(
select dv_address.address_id
from dv_address
where (dv_address.district)
in
(
select dv_address.district 
from dv_address
group by dv_address.district
order by COUNT(*) desc
limit 1
)
);



/*ouput the most common rating by highest group count*/
select dv_film.rating as least_common_rating, count(dv_film.rating) as number_of_least_common_rating
from dv_film
group by dv_film.rating
order by count(*) asc
limit 1;



/*Output the first last name of authors whose author_ids appear
in the top 10 most frequent author_id in cb_books*/
select cb_authors.first_name, cb_authors.last_name
from cb_authors
where (cb_authors.author_id)
in
(
select cb_books.author_id
from cb_books
group by cb_books.author_id
order by COUNT(*) desc
limit 10
);


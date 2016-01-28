/*question 1
Select the frst and last names and phone numbers of all people who are customers of both Smith
Video and Smith Books.*/

SELECT dv_customer.first_name, dv_customer.last_name, phone
FROM dv_customer, cb_customers, dv_address
WHERE dv_customer.address_id=dv_address.address_id AND dv_customer.first_name=cb_customers.first_name AND dv_customer.last_name=cb_customers.last_name;

/*question 2
count how many first edition books are present in Smith Books per publisher.
Return publisher names and the number of  frst edition books per publisher, sorted in descending order.*/

SELECT publisher, count(edition) FROM cb_books WHERE edition=1 GROUP BY publisher ORDER BY count(edition) DESC;

/*question 3
find the first and last names of all customers who live in the district having the most customers*/

CREATE VIEW maxdistrictcount AS
SELECT district, count(customer_id) FROM dv_customer, dv_address
WHERE dv_customer.address_id=dv_address.address_id GROUP BY district ORDER BY count(customer_id) DESC;

CREATE VIEW maxdistrict AS 
SELECT district from maxdistrictcount WHERE count=(SELECT MAX(count) from maxdistrictcount);

SELECT  first_name, last_name  FROM dv_customer c, dv_address a,maxdistrict
WHERE c.address_id=a.address_id AND a.district=maxdistrict.district;

DROP VIEW maxdistrictcount CASCADE;

/*question 4
find the rating that is the most common among films in the Smith Video database, and how many films have that rating*/

SELECT rating,count(film_id) AS "number of films" FROM dv_film GROUP BY rating ORDER BY count(film_id) DESC LIMIT 1;

/*question 5
find the first and last names of the top 10 authors when ranked by the number of books each has written */

SELECT first_name, last_name, cb_books.author_id, count(title) AS "number of books"
FROM  cb_books, cb_authors WHERE cb_books.author_id=cb_authors.author_id
GROUP BY first_name, last_name, cb_books.author_id ORDER BY count(title) DESC LIMIT 10;


DROP TABLE dv_customer;
DROP TABLE dv_address;
DROP TABLE dv_film;
DROP TABLE cb_customers;
DROP TABLE cb_books;
DROP TABLE cb_authors;
DROP TABLE mg_customers;
DROP TYPE mpaa_rating;
DROP SEQUENCE mg_customers_seq;

/*this script creates relations of the requited tables*/
CREATE TYPE mpaa_rating AS ENUM 
    (
     'G',
     'PG',
     'PG-13',
     'R',
     'NC-17'
    );

CREATE TABLE dv_customer 
	(
     customer_id int,
     first_name character varying(50),
     last_name character varying(50),
     email character varying(50),
     address_id int,
     active boolean
    );

CREATE TABLE dv_address
	(
     address_id int,
     address character varying(50),
     address2 character varying(50),
     district character varying(50),
     city_id int,
     postal_code character varying(50),
     phone character varying(50)
    );

CREATE TABLE dv_film 
	(
     film_id int,
     title character varying(50),
     description text,
     length smallint,
     rating mpaa_rating
    );
    
CREATE TABLE cb_customers
    (
     last_name character varying(50),
     first_name character varying(50)
    );
    
CREATE TABLE cb_books
    (
     title character varying(50),
     author_id int
    );
    
CREATE TABLE cb_authors
    (
     author_id int,
     first_name character varying(50),
     last_name character varying(50)
    );
    
CREATE TABLE mg_customers
    (
     customer_id int,
     first_name character varying(50),
     last_name character varying(50),
     email character varying(50),
     address_id int,
     active boolean
    );
 

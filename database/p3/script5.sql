/*create a view with condition where the address_id is the same
for merged customer and address info*/
create view customer_city as(
  select a.first_name, a.last_name, b.city_id
  from mg_customers a, dv_address b
  where a.address_id = b.address_id
);

/*group the district and count the number of rows for
each district, thus the amount of people and put them
in desc order highest number appears first*/
create view district_stats as(
  select district, count(*)
  from dv_address
  group by district
  order by count(*) asc
);

/*order them by count the smallest show up first*/
select district
from district_stats
order by count asc
limit 5;

/*renames view to community_stats*/
alter view customer_city rename to customerByCity;

select count(*) as OrderCount, sum(tax_amount) as tax_amount
from orders;

select category_name, count(*) as product_count,
      max(list_price) as mostexpensive
from categories c join products p
  on c.category_id = p.category_id
group by category_name
order by product_count desc;

select email_address, sum(item_price * quanity) as item_price_sum
sum (discount_amount * quanity) as discount_amount_total
from customers c join orders o
  on c.customer_id = o.customer_id
group by  emailaddress
order by item_price_sum desc;

select distinct category_name
from categories
where category_id in
     (select category_id from products)
order by category_name;


select product_name, list_price
from products
where list_price >
     (select avg (list_price)
      from products
      where list_price > 0)
order by list_price desc;

select category_name
from categories as c
where not exists
    (select 1
     from products as p
     where p.category_id =c.category_id);

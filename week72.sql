create or replace view order_item_products
as
select o.order_id as orderid, o.order_date as orderdate, o.tax_amount as taxamount, o.ship_date as shipdate,
 oi.item_price as itemprice, oi.discount_amount as discountamount, 
 (oi.item_price-oi.discount_amount) as final_price,oi.quantity,
 (oi.quantity*(oi.item_price-oi.discount_amount)) as item_total, p.product_name
from  orders o join order_items oi
  on o.order_id = oi.order_id join products p
  on oi.product_id = p.product_id;


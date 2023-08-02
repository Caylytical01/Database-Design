select list_price,
       format(list_price, 1) as total_format,
       convert(list_price, signed) as total_convert, 
       cast(list_price as signed) as total_cast
from products;

select list_price, discount_percent,
 round(list_price * discount_percent/100) as discount_amount
from products;

select date_format(order_date, '%Y')
from orders;

select date_format(order_date, '%b-%d-%Y')
from orders;

	
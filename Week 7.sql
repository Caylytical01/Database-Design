use my_guitar_shop;

drop procedure if exists test;

-- change statement delimiter from semicolon to double front slash
delimiter //

create procedure test()
begin
  declare product_count int;

  select count(product_name)
from products,
  if product_count> 0 
    select 'the number of products is greater than or equal to 7 as message;
  else
    select 'the number of products is less than 7 as message;
  end if;  
end//

-- change statement delimiter from semicolon to double front slash
delimiter ;

call test();

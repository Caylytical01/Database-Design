use my_guitar_shop;

drop procedure if exists test;

delimiter //

create procedure test()
begin
  declare sql_error int default false;
  
  declare continue handler for sqlexception
    set sql_error = true;

  start transaction;
  
  delete from addresses
  where customer_id = 8;

  delete from customers
  where customer_id = 8;

  commit;
  
  if sql_error = false then
    commit;
    select 'the transaction was committed.';
  else
    rollback;
    select 'the transaction was rolled back.';
  end if;
end//

delimiter ;

call test();

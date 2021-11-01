use classicmodels;
DELIMITER //
CREATE procedure findAllCustomer()
begin
    select * from customers;
end //
DELIMITER ;

call findAllCustomer();


use product;
#Hien thi
DELIMITER //
create procedure displayProduct()
begin
    select * from products;
end //
delimiter ;

call displayProduct();
#add sp
delimiter //
create procedure addProduct(IN pCode varchar(255), IN pName varchar(255), IN pPrice int, IN pAmount int,
                            IN pDescription varchar(255), IN pStatus varchar(255))
begin
    insert into product.products(pCode, pName, pPrice, pAmount, pDescription, pStatus)
    values (pCode, pName, pPrice, pAmount, pDescription, pStatus);
end //
delimiter ;

call addProduct('BM', 'Banh my', 10000, 10, 'Khong ngon', 'Con hang');

#insert sp
delimiter //
create procedure insertProduct(IN id int, IN pCode varchar(255), IN pName varchar(255), IN pPrice int, IN pAmount int,
                               IN pDescription varchar(255), IN pStatus varchar(255))
begin
    update products
    set products.pCode                = pCode,
        product.products.pName        = pName,
        product.products.pPrice       = pPrice,
        product.products.pAmount      = pAmount,
        product.products.pDescription = pDescription,
        product.products.pStatus      = pStatus
    where products.id = id;
end //
delimiter ;
#
call insertProduct(1, 'BM', 'Banh my', 10000, 10, 'Khong ngon', 'Con hang');

#delete product
DELIMITER //
create procedure deleteProduct(IN pId int)
begin
    delete from products where product.products.id = pId;
end //
delimiter ;
#
call deleteProduct(1);

#View

#Tao View
create view product.views as
    select product.products.pCode, product.products.pName, product.products.pPrice, product.products.pStatus
    from product.products;
select * from product.views;
#delete view
drop view product.views;
#insert view
update product.products set product.products.pName = 'Banh my xa xiu' where product.products.pCode like 'B';
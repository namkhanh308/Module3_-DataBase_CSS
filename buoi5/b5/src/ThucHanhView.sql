use classicmodels;
create view customer_view as
    select  c.customerName, c.customerNumber, phone
    from customers c;

select * from customer_view;

#update mot truong trong bang
update customer_view set customerName = 'Loc' where customerName like 'Atelier graphique';

#update ca bang
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

#xoa view
DROP VIEW customer_views;
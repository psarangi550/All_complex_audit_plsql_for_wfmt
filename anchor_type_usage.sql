create table product (
    product_id number,
    product_name varchar(255),
    product_price number
);

insert into product (product_id, product_name,product_price) values(1001,'watch', 100);
insert into product (product_id, product_name,product_price) values(1002,'blower', 200);
insert into product (product_id, product_name,product_price) values(1003,'camera', 150);
commit;

DECLARE
    p_id number;
    p_name varchar(255);
    p_price number;
begin
    p_id:=1001;
    select product_name,product_price into p_name,p_price
    from product where product_id = p_id;
    dbms_output.put_line('Product name ' || p_name);
    dbms_output.put_line('Product price '|| p_price);
end;
/

/* to make it dynamic */

DECLARE
    p_id number;
    p_name varchar(9);
    p_price number;
begin
    p_id:=&product_id;
    select product_name,product_price into p_name,p_price
    from product where product_id = p_id;
    dbms_output.put_line('Product name ' || p_name);
    dbms_output.put_line('Product price '|| p_price);
end;
/


/*Handling the Same with the exception block */
DECLARE
    p_id number;
    p_name varchar(9);
    p_price number;
begin
    p_id:=&product_id;
    select product_name,product_price into p_name,p_price
    from product where product_id = p_id;
    dbms_output.put_line('Product name ' || p_name);
    dbms_output.put_line('Product price '|| p_price);
exception
    when value_error then 
    dbms_output.put_line('Provided value mismatch');
    when no_data_found then 
    dbms_output.put_line('product id does not exist ');
end;
/

/* modifying the  size of the product_name */

alter table product modify product_name varchar(25);

/*inserting one more record */

insert into product (product_id, product_name,product_price) values(1004,'refrigirator', 250);

DECLARE
    p_id number;
    p_name varchar(9);
    p_price number;
begin
    p_id:=&product_id;
    select product_name,product_price into p_name,p_price
    from product where product_id = p_id;
    dbms_output.put_line('Product name ' || p_name);
    dbms_output.put_line('Product price '|| p_price);
exception
    when value_error then 
    dbms_output.put_line('Provided value mismatch');
    when no_data_found then 
    dbms_output.put_line('product id does not exist ');
end;
/

DECLARE
    p_id product.product_id%TYPE;
    p_name product.product_name%TYPE;
    p_price product.product_price%TYPE;
begin
    p_id:=&p_id;
    select product_name,product_price into p_name,p_price
    from product where product_id=p_id;
    dbms_output.put_line('product_name ' || p_name);
    dbms_output.put_line('product_price  ' || p_price);
exception
    when no_data_found then
        dbms_output.put_line('product id does not exist');
    when value_error then
        dbms_output.put_line('provided value being wrong'); 
end;
/

/* now if we change the column size or column data type it will also synced with the provided data*/
alter table rika.product modify product_name varchar2(17) ;

insert into product (product_id, product_name,product_price) values(1004,'refrigirator', 250);
declare
    type my_varray is varray (5) of number ;
    v_var  my_varray :=my_varray(2,4,6,8,10);
begin
    dbms_output.put_line(v_var(1));
end;
/

/*using it in alternate way */

declare
    type my_varray is varray (5) of number ;
    v_var  my_varray;
begin
    v_var:=my_varray(2,4,6,8,10);
    dbms_output.put_line(v_var(1));
end;
/

declare
    type my_varray is varying array (5) of number ;
    v_var  my_varray;
begin
    v_var:=my_varray(2,4,6,8,10);
    dbms_output.put_line(v_var(1));
end;
/

/*creating the varray data type permanently which can store as a db object*/

create or replace type my_new_var_array 
is varray (6) of varchar2(255); 
/

/*changring the size of existoing varray collection data type variable */

alter type my_new_var_array modify LIMIT 7 cascade ;

/* or the alternate way */

alter type my_new_var_array modify LIMIT 8 invalidate ;

/*using it in the for loop */
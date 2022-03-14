set serveroutput on
set pagesize 100
set linesize 100
set sqlnumber off
set verify off
declare
    type my_nest_col is TABLE OF varchar2(255);
    my_var my_nest_col:=my_nest_col('rika','abi');
    my_new_var my_nest_col ;
begin
    if my_var is not NULL then
        dbms_output.put_line('There are values in the nested table collection ');
    else 
        dbms_output.put_line('Null value');
    end if;

    my_var:=my_new_var;
    if my_var is not NULL then
        dbms_output.put_line('There are values in the nested table collection ');
    else 
        dbms_output.put_line('Null value');
    end if;

    /* if we want to use it then we have to use it as below */
    my_var:=my_nest_col('rika','abi','gundu');
    if my_var is not NULL then
        dbms_output.put_line('There are values in the nested table collection ');
    else 
        dbms_output.put_line('Null value');
    end if;


end;
/

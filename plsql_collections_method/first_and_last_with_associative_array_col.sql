set serveroutput on
set pagesize 100
set linesize 100
set sqlnumber off
set verify off
declare 
    type my_asso_arr is TABLE OF varchar2(50) INDEX BY varchar2(50);
    my_var my_asso_arr;
begin
    my_var('python'):='programming';
    my_var('flask'):='framework';
    my_var('django'):='framework';
    dbms_output.put_line('First Element is ' || my_var.FIRST);
    dbms_output.put_line('First Element is ' || my_var.LAST);
end;
/

/*trying it on the nested table collection then */
declare 
    type my_asso_arr is TABLE OF varchar2(50);
    my_var my_asso_arr;
begin
    my_var:=my_asso_arr(2,4,6,8,10);
    dbms_output.put_line('First Element is ' || my_var.FIRST);
    dbms_output.put_line('First Element is ' || my_var.LAST);
end;
/
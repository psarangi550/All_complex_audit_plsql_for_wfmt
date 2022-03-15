set serveroutput on
set pagesize 100
set linesize 100

declare
    type nest_tbl is TABLE OF number ;
    v_var nest_tbl;/* un initialized nested table colle ction variable */
    my_exp exception ;
    pragma exception_init(my_exp, -06531);
begin
    dbms_output.put_line(v_var.FIRST);

exception
    when my_exp then
        dbms_output.put_line('initialize you fool');
end;
/

--exception:-raised
-- ERROR at line 1:
-- ORA-06531: Reference to uninitialized collection
-- ORA-06512: at line 5

/*with intialization */
set serveroutput on
set pagesize 100
set linesize 100
declare
    type nest_tbl is TABLE OF number ;
    v_var nest_tbl:=nest_tbl();/* initialized nested table colle ction variable but  0  element */
    my_exp exception ;
    pragma exception_init(my_exp, -06531);
begin
    dbms_output.put_line(' value of variable is  '||v_var.FIRST);/* this will return empty */

exception
    when my_exp then
        dbms_output.put_line('initialize you fool');
end;
/

/* now initializing with the value then*/

set serveroutput on
set pagesize 100
set linesize 100
declare
    type nest_tbl is TABLE OF number ;
    v_var nest_tbl:=nest_tbl(10,20,30,40);/* initialized nested table colle ction variable  with element */
    my_exp exception ;
    pragma exception_init(my_exp, -06531);
begin
    dbms_output.put_line(' index of first  '|| v_var.FIRST);/* this will return first index value */
    dbms_output.put_line(' Corresponding index value are  '|| v_var(v_var.FIRST));
    dbms_output.put_line(' index of last is  '|| v_var.LAST);/* this will return last index value */
    dbms_output.put_line(' Corresponding index value are  '|| v_var(v_var.LAST));
    /*index value of the last being */
    v_var.delete(1);/*removing one element from index 1 */
    dbms_output.put_line(' index of first  '|| v_var.FIRST);
    dbms_output.put_line(' Corresponding index value are  '|| v_var(v_var.FIRST));
    v_var.TRIM; /*trimmming the last value */
    dbms_output.put_line(' index of last '|| v_var.LAST);
    dbms_output.put_line(' Corresponding index value are  '|| v_var(v_var.LAST));
exception
    when my_exp then
        dbms_output.put_line('initialize you fool');
end;
/
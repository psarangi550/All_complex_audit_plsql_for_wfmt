set serveroutput on
set pagesize 100
set linesize 100
set sqlnumber off
set verify off

/*here remeber that multiset operator application on the nested_table only not on varray type*/

/*here using the multiset UNION /multiset UNION ALL/ multiset UNION DISTINCT*/
/* fetching the combination but here its not in sorted order
*/
/*multiset UNION /multiset UNION ALL  in this case sorting will not happen*/
declare
    type my_nested_tbl is TABLE OF number ;
    my_var  my_nested_tbl ;
    my_new_var my_nested_tbl ;
    result_var my_nested_tbl;
begin
    my_var:=my_nested_tbl(2,4,6,2,5,7,8,1);
    my_new_var:=my_nested_tbl(2,4,5,2,1,8,9,1);
    -- result_var:=my_var MULTISET UNION my_new_var ; 
    -- result_var:=my_var MULTISET UNION ALL my_new_var;
    result_var:=my_var MULTISET UNION DISTINCT my_new_var;
    for i  in 1 ..  result_var.count
        loop
          dbms_output.put_line('result combination is ' || result_var(i));
        end loop ;
end;
/

/*using the multiset intersect operator to fetch the common element*/
/*multiset INTERSECT /multiset INTERSECT ALL / multiset  INTERSECT DISTINCT  in this case sorting will not happen*/

set serveroutput on
set pagesize 100
set linesize 100
set sqlnumber off
set verify off
declare
    type my_nested_tbl is TABLE OF number ;
    my_var  my_nested_tbl ;
    my_new_var my_nested_tbl ;
    result_var my_nested_tbl;
begin
    my_var:=my_nested_tbl(2,4,6,2,5,7,8,1);
    my_new_var:=my_nested_tbl(2,4,5,2,1,8,9,1);
    -- result_var:=my_var MULTISET UNION my_new_var ; 
    -- result_var:=my_var MULTISET UNION ALL my_new_var;
    result_var:=my_var MULTISET INTERSECT DISTINCT my_new_var;
    for i  in 1 ..  result_var.count
        loop
          dbms_output.put_line('result combination is ' || result_var(i));
        end loop ;
end;
/

/*using the multiset EXCEPT /multiset EXCEPT ALL /multiset EXCEPT DICTINCT for the same */

set serveroutput on
set pagesize 100
set linesize 100
declare
    type my_nxt_tbl is TABLE OF number ;
    my_var_varray my_nxt_tbl;
    my_var_new_v_array my_nxt_tbl ;
    result_var my_nxt_tbl;
begin
    my_var_varray:=my_nxt_tbl(2,4,2,3,5);
    my_var_new_v_array:=my_nxt_tbl(1,2,3,4,1);
    result_var:=my_var_varray multiset EXCEPT my_var_new_v_array;
    for i in 1 .. result_var.count
    loop
      dbms_output.put_line(result_var(i));
    end loop ;
end;
/
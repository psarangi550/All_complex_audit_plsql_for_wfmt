set serveroutput on
declare 
    type my_nest_arr is table of varchar2(50);
    v_var my_nest_arr := my_nest_arr();/*initalizing the nested table variable */
begin
    v_var.EXTEND(5);
    for i in 1 ..v_var.count
    loop
        -- v_var.EXTEND();
        v_var(i):=2*i;
        dbms_output.put_line('value '||1 || 'is '|| v_var(i));
    end loop ;
end;
/

/* alternate approach */

set serveroutput on
declare 
    type my_nest_arr is table of varchar2(50);
    v_var my_nest_arr := my_nest_arr();/*initalizing the nested table variable */
begin
    for i in 1 .. 6
    loop
        v_var.EXTEND();
        v_var(i):=2*i;
        dbms_output.put_line('value '||1 || 'is '|| v_var(i));
    end loop ;
end;
/
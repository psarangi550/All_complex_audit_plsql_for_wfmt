set serveroutput on
set pagesize 100
set linesize 100

declare 
    type my_nest is TABLE OF number ;
    v_var my_nest:=my_nest(10,20,30,40,50);
    value number;
begin
    if v_var.EXISTS(6) then
        dbms_output.put_line('Elelment value @ ' || 6 || v_var(6));
    else
        v_var.EXTEND;
        v_var(6):=&value;
        dbms_output.put_line('Elelment value @ ' || 6 || ' is ' ||v_var(6));
    end if ;

end;
/
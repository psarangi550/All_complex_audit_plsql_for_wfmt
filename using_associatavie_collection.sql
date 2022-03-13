set serveroutput ON
declare
    type my_ac_var is table of number index by varchar2(50);
    v_var  my_ac_var ;
    v_counter varchar2(50);
begin
    v_var('python'):=1000;
    v_counter:=v_var.FIRST;
    v_var('flask'):=2000;
    while v_counter is Not NULL 
    loop
        dbms_output.put_line('value of ' || v_counter || 'is ' || v_var(v_counter));
        v_counter:=v_var.NEXT(v_counter);
    end loop ;
    /*fetching the data in here */
    -- v_counter_next:=v_var.NEXT();
    
end;
/

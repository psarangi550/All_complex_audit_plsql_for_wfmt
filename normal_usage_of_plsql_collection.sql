DECLARE
    TYPE my_nested_table IS TABLE OF number;
    v_var my_nested_table ;
begin
    v_var:=my_nested_table(2,4,6,8,10);
    dbms_output.put_line(v_var.*);
end;
/

/*another example of plsql collection is */

DECLARE
    type students IS TABLE OF varchar2(255);
    type teacher IS TABLE OF varchar2(255);

    s_var students ;
    t_var teacher;

    s_sum_var number ;
    t_sum_var number ;
    i number ;

begin
    s_var:=students('rika','abi','gundu');
    t_var:=teacher('python','django','flask');

    s_sum_var:=s_var.count;
    t_sum_var:=t_var.count;

    dbms_output.put_line(s_sum_var);
    dbms_output.put_line(t_sum_var);


    for i in 1 .. s_sum_var
    loop
      dbms_output.put_line(s_var(i));
    end loop ;

    for i in 1.. t_sum_var
    loop
      dbms_output.put_line(t_var(i));
    end loop ;

exception 
    when others then
        dbms_output.put_line('something went worong'); 
end;
/
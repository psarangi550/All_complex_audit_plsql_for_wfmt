declare
    type my_nest_table is table of  varchar2(255);
    my_var my_nest_table ;
    i number;
begin
    i:=1;
    my_var:=my_nest_table('rika','gundu','abi');
    while i <= my_var.count
    loop
        dbms_output.put_line(my_var(i));
        i:=i+1;
    end loop ;
exception
  when others then
    dbms_output.put_line('something went absolutely wrong ');
end;
/
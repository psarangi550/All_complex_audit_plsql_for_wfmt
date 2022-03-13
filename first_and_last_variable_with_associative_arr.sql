set serveroutput on
set pagesize 100
set linesize 100
set sqlnumber off
set verify off
declare
    type my_asscoiate_arr is table of varchar2(50) index by varchar2(50);
    my_var my_asscoiate_arr ;
begin
    my_var('python'):='programing';
    my_var('flask'):='framework';
    my_var('django'):='framework';
    dbms_output.put_line(my_var.FIRST);
    dbms_output.put_line(my_var.LAST);
    if my_var.exists('flask') then
        dbms_output.put_line('flask exists');
    else
        dbms_output.put_line('flask does not exists');
    end if ;
    dbms_output.put_line(my_var.next('flask'));
    dbms_output.put_line(my_var.prior('flask'));
exception
  when others then
    dbms_output.put_line(' something went wrong');
end;
/
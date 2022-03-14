set serveroutput on
set linesize 100
set pagesize 100
declare 
    type my_strong_ref is ref cursor return rika.emp%ROWTYPE; /*strong ref cursor example */
    my_var my_strong_ref ;
    v_emp_no rika.emp%ROWTYPE;
begin
    open my_var for select * from rika.emp;
    loop
        fetch my_var into v_emp_no ;
        if my_var%NOTFOUND then
            exit ;
        end if ;
        dbms_output.put_line('Emp no is ' || v_emp_no.empno);
    end loop ;
    close my_var ;
end;
/
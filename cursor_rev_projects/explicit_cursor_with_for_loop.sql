set serveroutput on
set linesize 100
set pagesize 100

declare
    cursor my_exp_cur is select empno,ename from rika.emp ;
    v_empno rika.emp.empno%TYPE ;
    v_ename rika.emp.ename%TYPE;
begin
    open my_exp_cur ;
    if my_exp_cur%isopen then
        dbms_output.put_line('cursor is open');/*checking the cursor being open or not */
        loop
            fetch my_exp_cur into v_empno ,v_ename ;
            dbms_output.put_line('Employee No is ' || v_empno );
            dbms_output.put_line('Employee Name is ' || v_ename);
            exit when my_exp_cur%NOTFOUND;
        end loop ;
    else
      dbms_output.put_line('cursor is closed');
    end if ;
    close  my_exp_cur ;
end;   
/ 

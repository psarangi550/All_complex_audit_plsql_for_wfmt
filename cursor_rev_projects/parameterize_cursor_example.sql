set serveroutput on
set linesize 100
set pagesize 100
declare 
    cursor my_fetch_cur(dept_no number ) is select empno,ename from rika.emp where deptno=dept_no;
    v_emp_no rika.emp.empno%TYPE;
    v_ename rika.emp.ename%TYPE;
begin
    open my_fetch_cur(dept_no=>10);
    loop
        fetch my_fetch_cur into v_emp_no, v_ename ; 
        if my_fetch_cur%NOTFOUND then
            exit ;
        end if ;
        dbms_output.put_line('Emp no is ' || v_emp_no);
        dbms_output.put_line('Emp name is ' || v_ename);
    end loop ;
    close my_fetch_cur ;
    /* opening the cursor with another value as */
    dbms_output.put_line('------------------------------------------------');
    open my_fetch_cur(dept_no=>20);
        loop
        fetch my_fetch_cur into v_emp_no, v_ename ; 
        if my_fetch_cur%NOTFOUND then
            exit ;
        end if ;
        dbms_output.put_line('Emp no is ' || v_emp_no);
        dbms_output.put_line('Emp name is ' || v_ename);
    end loop ;
    close my_fetch_cur ;
end;
/
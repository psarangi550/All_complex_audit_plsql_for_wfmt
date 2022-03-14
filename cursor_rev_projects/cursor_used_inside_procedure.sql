set serveroutput on
set linesize 100
set pagesize 100
create or replace procedure my_cur_proc 
(
    v_dept_no IN number ,
    my_cur OUT Sys_RefCursor 
)
is 
begin
    open my_cur FOR select * from rika.emp where deptno=v_dept_no;
    dbms_output.put_line('procedure ran successfully and return a cursor which is open ');
end;
/
/* calling the procedure */
declare 
    my_fetch_ref_cur Sys_RefCursor ;
    v_emp rika.emp%ROWTYPE;
begin
    my_cur_proc(v_dept_no=>10,my_cur=>my_fetch_ref_cur);
    loop
        fetch my_fetch_ref_cur into v_emp;
        exit when my_fetch_ref_cur%NOTFOUND;
        dbms_output.put_line('Employee No are ' || v_emp.empno);
    end loop ;
    close my_fetch_ref_cur ;
end ;
/
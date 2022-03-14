create or replace function ref_func
(
    v_deptno IN number 
)
return Sys_RefCursor
is
    empno_cur Sys_RefCursor ;

begin
    open empno_cur FOR select * from rika.emp where deptno=v_deptno;
    dbms_output.put_line('function processed successfully and you will be getting the cursor in return ');
    return empno_cur ;
End;
/


/* now using this function while executing */

declare
    my_func_ref_cur Sys_RefCursor ;
    vemp rika.emp%ROWTYPE;
begin
    my_func_ref_cur:=ref_func(v_deptno=>10);
    loop
        fetch my_func_ref_cur into vemp ;
        exit when my_func_ref_cur%NOTFOUND ;
        dbms_output.put_line('Emp No is '||vemp.empno);
    end loop;
    close my_func_ref_cur ;
end ;
/
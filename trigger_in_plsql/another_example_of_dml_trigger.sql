set serveroutput on
set linesize 100
set pagesize 100
create or replace trigger PRINTGR
after update on new_emp 
for each row
enable 
declare
    v_user varchar2(20) ;
begin
    select user into  v_user
    from dual ;
    dbms_output.put_line('updated by User ' || v_user);
end;
/

/*updating record checking */
update new_emp set ename='prateek' where empno=7788;


/**creating the audit table */

create table auditlog (
    username varchar(255),
    date_exec date ,
    emp_number number,
    op_type varchar(255)
);
/
set serveroutput on
set pagesize 100
set linesize 100
create or replace trigger audit_tgr
after insert or update or delete on rika.new_emp
for each row 
declare 
    v_user_name varchar(255);
    v_date_exec date ;
    v_emp_number number ;
    v_op_type varchar2(255);
begin
    IF INSERTING then
        SELECT user, sysdate into v_user_name , v_date_exec from dual;
        v_emp_number:=:NEW.empno;
        v_op_type:='insert';
        INSERT INTO auditlog (username, date_exec,emp_number,op_type) values (v_user_name,v_date_exec,v_emp_number,v_op_type);
        dbms_output.put_line('trigger executed successfully');
    
    ELSIF UPDATING then
        SELECT user,sysdate into v_user_name , v_date_exec from dual;
        v_emp_number:=:OLD.empno;
        v_op_type:='update';
        INSERT INTO auditlog (username, date_exec,emp_number,op_type) values (v_user_name,v_date_exec,v_emp_number,v_op_type);
        dbms_output.put_line('trigger executed successfully');
    ELSE
        SELECT user,sysdate into v_user_name , v_date_exec from dual;
        v_emp_number:=:OLD.empno;
        v_op_type:='delete';
        INSERT INTO auditlog (username, date_exec,emp_number,op_type) values (v_user_name,v_date_exec,v_emp_number,v_op_type);
        dbms_output.put_line('trigger executed successfully');
    end if ;
end;
/


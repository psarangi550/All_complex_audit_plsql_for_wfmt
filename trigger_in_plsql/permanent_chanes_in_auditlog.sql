/*creating a CTAS for the emp table */
create table rika.new_employee as
select * from rika.emp
/
/*checking the content */
set serveroutput on
set linesize 100
set pagesize 100
select * from rika.new_employee;

/*creating the  audit log to handle the logs permanemtly even for the rollbacks*/


/*creating the auditpermlog table*/

create table auditpermlog(
    username varchar(255),
    ondate date ,
    ontime varchar(255),
    action varchar(255),
    emp_num number
);

alter table auditpermlog modify ontime varchar2(255)

/*creating the triger to audit the permanent change of rika.new_employee into auditpermlog even in case of rollback */
/*here we need to use the pragma autonomous transaction so that tranaction will be separated from each other*/

create or replace trigger auditpermlog_tkg
before insert or update or delete on rika.new_employee
for each row /*making as row level trigger*/
DECLARE
    v_username varchar(255) ;
    v_ondate date ;
    v_ontime varchar(255) ;
    v_action varchar(255) ;
    v_emp_num number ;
    --defining the procedure which will be responsible for calling the audit log table 
    procedure audlit_proc(
        p_username IN varchar2,
        p_ondate IN date ,
        p_ontime IN varchar2 ,
        p_action IN varchar2 ,
        p_emp_num IN number 
    )
    is
        pragma autonomous_transaction ; /*using the pragma  autonomous_transaction to separate the tranaction*/
    begin
        insert into auditpermlog(username,ondate,ontime,action,emp_num)
        values (p_username,p_ondate,p_ontime,p_action,p_emp_num);
        commit;/*using the commit to make those changes permanent */
        dbms_output.put_line('proc executed successfully');
    end;
BEGIN
    select user,sysdate, to_char(sysdate,'HH24:MI') into v_username,v_ondate,v_ontime
    from dual;
    if INSERTING then
        v_action:= 'insert';
        v_emp_num:=:NEW.empno;
    elsif UPDATING then
        v_action:= 'insert';
        v_emp_num:=:OLD.empno;
    else
       v_action:= 'delete';
       v_emp_num:=:OLD.empno; 
    end if ;

    audlit_proc(
        p_username=>v_username,
        p_ondate=>v_ondate,
        p_ontime=>v_ontime,
        p_action=>v_action,
        p_emp_num=>v_emp_num
    );/*calling the procedure to insert the record befor the operation can took place*/
END;
/

update rika.new_employee set ename='prateek' where empno=7788;









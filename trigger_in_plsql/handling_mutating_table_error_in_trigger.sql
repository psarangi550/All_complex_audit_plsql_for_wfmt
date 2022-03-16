/*mutating table error will occure if we execute*/

set serveroutput on
set line 100
set pagesize 100
create or replace  trigger check_tgr
after insert or update of deptno on rika.new_emp
for each row 
declare 
    max_emp_count constant pls_integer :=10;
    curr_emp_count pls_integer ;
begin
    select count(*) into curr_emp_count from rika.new_emp group by deptno having deptno=:NEW.deptno ;
    dbms_output.put_line(curr_emp_count);
    if curr_emp_count > max_emp_count then
        raise_application_error(-2000,'maximum length reached') ;
    end if;
end;
/


/* dropping the exist trigger to recreate with solution */

drop trigger check_tgr;

/*checking an example of a package as  */

create or replace package  test_pkg is 
    my_global_number number:=10;
end test_pkg ;
/

/*calling the package to fetch the value */
set serveroutput on
declare 
result_var number ;
begin
   result_var:=test_pkg.my_global_number;
   dbms_output.put_line(result_var);
end;

/*similarly creating a new package header to capture a global variable from row level trigger*/

create or replace package check_pkg is
    dept_no rika.new_emp.deptno%TYPE;
end check_pkg ;
/

/*now we need to create a package which should provide the value from row level trigger to emp */

create or replace  trigger check_tgr_row
after insert or update of deptno on rika.new_emp
for each row
declare
begin
    check_pkg.dept_no:=:NEW.deptno ;
    dbms_output.put_line('successfully captured');
end;
/

create or replace  trigger check_tgr_stmt
after insert or update of deptno on rika.new_emp
declare
    max_emp_count constant pls_integer :=10;
    curr_emp_count pls_integer ;
begin
    select count(empno) into curr_emp_count from rika.new_emp group by deptno having deptno=check_pkg.dept_no;
    if curr_emp_count > max_emp_count then 
        raise_application_error(2000,'Limit Exceeded');
    end if ;
end;
/

/*validating now */
insert into rika.new_emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(7778,'Abi','CLERK',7839,sysdate,5000,null,20);




delete from rika.new_emp where empno in (7778,7769); 























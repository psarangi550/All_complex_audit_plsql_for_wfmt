select count(empno) from rika.emp group by deptno having deptno=20 ;

create or replace  trigger check_tgr
after insert on rika.emp
for each row 
declare 
    max_emp_count number :=10;
    curr_emp_count number ;
begin
    curr_emp_count:=select  count(empno) into curr_emp_count from rika.emp group by deptno having deptno=:NEW.deptno ;
    dbms_output.put_line('the current emp_count is =' || curr_emp_count );
end;


/* checking with procedure first */

create or replace  procedure check_proced
(
    dept_no IN number,
    count_var OUT number
)
is 
    max_emp_count constant number :=10;
begin
    select  count(empno) into count_var from rika.new_emp group by deptno having deptno=dept_no ; 
    if count_var > max_emp_count then 
        dbms_output.put_line('not ok');
    else
        dbms_output.put_line('ok');
        dbms_output.put_line('count is '|| count_var);
    end if;

exception
    when others then 
        dbms_output.put_line('something went wrong');

end;
/

/*calling the procedure */

declare 
    result_var number ;
begin
    check_proced(dept_no=>20,count_var=>result_var);
    dbms_output.put_line('result is ' || result_var);
end;
/

/*using the CTAS to replicate the dept table*/

select count(empno) from rika.new_emp group by deptno having deptno=20 ;

begin
insert all
    into rika.new_emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(7769,'shal','CLERK',7839,sysdate,5000,null,20)
    select * from dual;
end;
/

select * from rika.new_emp;


DECLARE
    vrec rika.emp%ROWTYPE;
    e_id rika.emp.EMPNO%TYPE;
begin
    e_id:=&EMPNO;
    select * into vrec 
    from rika.emp where EMPNO=e_id;
    dbms_output.put_line('EMP NO is ' || vrec.EMPNO);
    dbms_output.put_line('EMP NAME is ' || vrec.ENAME);
    dbms_output.put_line('EMP JOB is ' || vrec.JOB);
    dbms_output.put_line('EMP MGR is ' || vrec.MGR);
    dbms_output.put_line('EMP HIRE DATE is ' || vrec.HIREDATE);
    dbms_output.put_line('EMP sal is ' || vrec.SAL);
    dbms_output.put_line('EMP Commisiton  is ' || vrec.COMM);
    dbms_output.put_line('EMP Dept is ' || vrec.DEPTNO);

exception
    when no_data_found then
        dbms_output.put_line('emp_id provided not found');
    when value_error then
        dbms_output.put_line('data provided mismatch');
    when others then
        dbms_output.put_line('something went wrong');
end;
/
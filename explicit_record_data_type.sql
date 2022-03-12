DECLARE
    TYPE rec is record(
            e_no    rika.emp.EMPNO%TYPE,
            e_name  rika.emp.ENAME%TYPE,
            job_var rika.emp.JOB%TYPE,
            mgr_var rika.emp.MGR%TYPE,
            h_date  rika.emp.HIREDATE%TYPE,
            sal_var rika.emp.SAL%TYPE,
            comm_v  rika.emp.COMM%TYPE,
            dept_n  rika.emp.DEPTNO%TYPE

    );

    vrec rec ;--definging the vrec as record datat type

    e_id rika.emp.EMPNO%TYPE ;
begin
    e_id:=&EMPNO ;
    select * into vrec
    from rika.emp where EMPNO=e_id;
    dbms_output.put_line('EMP NO IS ' || vrec.e_no);
exception
    when no_data_found then
        dbms_output.put_line('employee is does not exist');
    when value_error then
        dbms_output.put_line('provided data is not compatable');
    when others then
        dbms_output.put_line('something went very wrong');

end;
/

select * from rika.emp where EMPNO=7900;
select * from rika.emp where EMPNO=7788;

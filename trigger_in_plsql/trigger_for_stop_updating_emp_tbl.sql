set serveroutput on
set linesize 100
set pagesize 100
/*using the CTAS Command*/
create table rika.new_emp as
select * from rika.emp;
/

select * from rika.new_emp;

/*now writing the trigeger to stop updating after 5:00 o clock */
set serveroutput on
set linesize 100
set pagesize 100
create or replace trigger STOPTGR
before update on new_emp
for each row
ENABLE
declare
    time_up date:=to_date('17','HH24');
    curr_time date:=to_date(to_char(sysdate, 'HH24'),'HH24');
begin
    if curr_time > time_up then
        raise_application_error(2000,'your time is up');
    end if ;
end;
/



ALTER TABLE new_emp ENABLE ALL TRIGGERS;
update new_emp set ename='prateek' where empno=7788;
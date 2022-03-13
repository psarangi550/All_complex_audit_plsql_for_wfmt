create or replace type new_varray is varray (5) of varchar2(255);
/

/*creeating the db table using the varray type  column */
create table store_employee (
    store_id number,
    city new_varray
);
/

/* inserting the record to the created table which is using the varray type column*/

insert into store_employee(store_id, city) values (1001,new_varray('Bangalore','Bhubaneswar'));
insert into store_employee(store_id, city) values (1001,new_varray('cuttack','Tangi'));
commit;

/*setting the serveroutput and linesize and pagesize in sql plus */
set serveroutput on
set linesize 100
set pagesize 100
set sqlnumber OFF
set verify on

/* selecting the data from the table which contains the  varray type column */

select s.store_id,c.*
from store_employee s,
table(s.city) c ;
/

/*alternate approach to fetch the value is*/
select store_id,city.*
from store_employee,
table(store_employee.city) ;
/



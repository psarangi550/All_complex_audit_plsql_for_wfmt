/*creating our own user defined type object*/

create or replace type new_obj as OBJECT 
(
    id number,
    days varchar2(10)
);
/
create or replace type my_obj is OBJECT 
(
    id number,
    days varchar2(10)
);
/


/*creating the nested table collection for the user defined object */

create or replace type nested_new_table 
is
TABLE of my_obj ;

/*now creating the table using the nested table collection which internally uses the user defined object */

create table stu_subj_new(
    stu_id number,
    stu_subj varchar2(255),
    subj_days nested_new_table
)
NESTED table subj_days STORE AS subj_days_details ;
/


/* now inserting the data to the same as */

insert into stu_subj_new (stu_id ,stu_subj,subj_days) values (1001,'rika',nested_new_table(my_obj(1,'mon')));
/
commit ;

/* selecting the data from the tables as  */

select stu_id,stu_subj,subj_days_details.*
from stu_subj_new,
table (stu_subj_new.subj_days) ;
/

/*using the alias name in the select query as */


select s.stu_id, s.stu_subj, t.*
from stu_subj_new s,
table (s.subj_days) t;
/

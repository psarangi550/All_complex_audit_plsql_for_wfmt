create or replace type nested_table
is
TABLE OF varchar2(255);
/

/* Creating the table based on the nested table as column value*/

create table stu_subj(
    stu_id number,
    stu_subj varchar2(255),
    sub_days nested_table 
)
NESTED TABLE sub_days STORE as subject_days ;
/

/*Inserting the data of nested tables into the tables*/

insert into stu_subj(stu_id,stu_subj,sub_days) values(1001,'rika',nested_table('mon','wed'));
commit;

insert into stu_subj(stu_id,stu_subj,sub_days) values(1002,'pratik',nested_table('tue','thr'));
commit;

insert into stu_subj(stu_id,stu_subj,sub_days) values(1003,'gundu',nested_table('sat','sun'));
commit;


/*unsupported type if we select Normally*/

select * from stu_subj ;

/* fetching all the data by using the select dql*/

select stu_id,stu_subj,subject_days.*
from stu_subj ,
table (stu_subj.sub_days) ;
/

/*using the alias name */

select s.stu_id , s.stu_subj ,t.*
from stu_subj s ,
table (s.sub_days) t;
/


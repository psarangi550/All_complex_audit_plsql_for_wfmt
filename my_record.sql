alter session set "_ORACLE_SCRIPT"=true;  /* to alter the session */
CREATE USER rika IDENTIFIED BY Liverpool2022; /* to create the user */
ALTER USER rika quota 1000M on USERS;
CREATE TABLE dept (deptno NUMBER(2,0),dname VARCHAR2(14),loc VARCHAR2(13),CONSTRAINT pk_dept PRIMARY KEY (deptno));

INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');
COMMIT;


declare
    type my_var_arr is varray (5) of number ;
    v_var my_var_arr ;
begin
    v_var := my_var_arr(1,2,3,4,5);
    dbms_output.put_line('total size is '|| v_var.LIMIT);
    --using the for loop to iterate over it
    for i in 1..v_var.LIMIT 
    loop
        v_var(i):=i*i;
        dbms_output.put_line ('i value is ' || i);
        dbms_output.put_line('value is '|| v_var(i));
    end loop ;
end;
/

/* subscript beyond limit if we are not providing any args while createting the varray elements*/

declare
    type my_var_arr is varray (5) of number ;
    v_var my_var_arr ;
begin
    v_var := my_var_arr();/*not passing any args then subscriipt beyond limit ORA-06533*/
    dbms_output.put_line('total size is '|| v_var.LIMIT);
    --using the for loop to iterate over it
    for i in 1..v_var.LIMIT 
    loop
        v_var(i):=i*i;
        dbms_output.put_line ('i value is ' || i);
        dbms_output.put_line('value is '|| v_var(i));
    end loop ;
end;
/

/*handling that exception using the pragma exception_init() as below */
declare
    type my_var_arr is varray (5) of number ;
    v_var my_var_arr ;
    my_exp exception;
    pragma exception_init(my_exp,-06533);
begin
    v_var := my_var_arr();/*not passing any args then subscriipt beyond limit ORA-06533*/
    dbms_output.put_line('total size is '|| v_var.LIMIT);
    --using the for loop to iterate over it
    for i in 1..v_var.LIMIT 
    loop
        v_var(i):=i*i;
        dbms_output.put_line ('i value is ' || i);
        dbms_output.put_line('value is '|| v_var(i));
    end loop ;
exception
    when my_exp then
        dbms_output.put_line ('provide the args doofus');
    when others then 
        raise_application_error(-2000,'something went wrong');
end;
/


/*alternate approach to add element to the varray using the EXTEND in build procedure of oracle engg*/
--EXTEND is the oracle inbuild procedure using which we can insert value into the varray
--EXTEND is used to allocate the memory to the varray element sequencially and increment also number 
--EXTEND provided with number (which is most of the time similar to the varray size) will allocate the memory and increment the value if args were provided to the EXTEND procedure 
--EXTEND without any number can be describe describe with the for loop which also going to increment the value and allovcate the memory till the limit of VARRAY
--but if it out side but no args provided then it will enter a single null value only

/*  synatx for EXTEND is <varry variable name>.EXTEND(args we want to allocate);    */


/*for EXTEND is <varry variable name>.EXTEND(with out args but inside for loop while iterate);   */



declare
    type my_var_arr_new is varray (5) of number ;
    v_var_new my_var_arr_new:=my_var_arr_new() ;/* initializing  varray data  with empty data */
begin
    v_var_new.EXTEND(5);/*not passing any args then subscriipt beyond limit ORA-06533*/
    --using the for loop to iterate over it
    for i in 1..v_var_new.LIMIT 
    loop
        v_var_new(i):=i*i;
        dbms_output.put_line ('i value is ' || i);
        dbms_output.put_line('value is '|| v_var_new(i));
    end loop ;
end;
/

/* alternative approach to use this as */

declare
    type v_arr_new is varying array (10) of  varchar2(255);
    v_new_var v_arr_new:= v_arr_new();/* initializing  varray data  with empty data */
begin
    for i in 1..v_new_var.LIMIT
    loop
      v_new_var.EXTEND();
      v_new_var(i):=2*i;
      dbms_output.put_line(' The value of i is ----->'||(i));
      dbms_output.put_line(' The value in the varray is ---->'||v_new_var(i));
    end loop ;
end;
/
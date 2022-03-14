declare 
    cursor my_cur is select ename from rika.emp fetch first 10 rows only ;
    /* defining the cursor */
    type my_nest is TABLE OF rika.emp.ename%TYPE;
    my_var my_nest :=my_nest();
    v_ename rika.emp.ename%TYPE;
    i number;
begin
    i:=1;
    open my_cur ;
    loop
        my_var.EXTEND ;
        fetch my_cur into v_ename;
        my_var(i):=v_ename;
        exit when my_cur%NOTFOUND ;
        dbms_output.put_line('ename is ' || v_ename);
        i:=i+1;
    end loop;
    dbms_output.put_line('done successfully ');
    close my_cur ;

    for a in 1 .. my_var.count
    loop
        dbms_output.put_line('Element is ' || my_var(a));
    end loop;
end;
/


/* alternate approach using collection methond LAST */

declare 
    cursor my_cur is select ename from rika.emp fetch first 10 rows only ;
    /* defining the cursor */
    type my_nest is TABLE OF rika.emp.ename%TYPE;
    my_var my_nest :=my_nest();
    v_ename rika.emp.ename%TYPE;
    -- i number;
begin
    -- i:=1;
    open my_cur ;
    loop
        my_var.EXTEND ;
        fetch my_cur into my_var(my_var.LAST);
        -- my_var(i):=v_ename;
        exit when my_cur%NOTFOUND ;
        -- dbms_output.put_line('ename is ' || v_ename);
        -- i:=i+1;
    end loop;
    dbms_output.put_line('done successfully ');
    close my_cur ;

    for a in 1 .. my_var.count
    loop
        dbms_output.put_line('Element is ' || my_var(a));
    end loop;
end;
/

create or replace PROCEDURE PRINT_GAME 
(
  TABLE_NAME IN VARCHAR2 
) AS 
BEGIN
    dbms_output.enable(10000);
    dbms_output.put_line(' ');
    IF lower(TABLE_NAME)='available_spots' THEN
        FOR ll in (SELECT R, C, TURN FROM available_spots where TURN is NULL) LOOP
        dbms_output.put_line(' ' || ll.R || ' ' || ll.C || ' ' || ll.TURN);
        END LOOP;
    END IF;
    IF lower(TABLE_NAME)='tic_tac_toe' THEN
        FOR ll in (SELECT cellId, col1, col2, col3 FROM tic_tac_toe) LOOP
        dbms_output.put_line(' ' || ll.col1 || ' ' || ll.col2 || ' ' || ll.col3);
        END LOOP;
    END IF;
    IF lower(TABLE_NAME)!='tic_tac_toe' AND lower(TABLE_NAME)!='available_spots' THEN
        dbms_output.put_line('invalid table name input');
    END IF;
    dbms_output.put_line(' ');
END PRINT_GAME;
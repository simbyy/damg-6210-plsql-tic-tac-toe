create or replace PROCEDURE CHECK_TURN 
(
  TURN IN NUMBER 
) AS 
var_turn number := nvl(turn, -1);
BEGIN
    IF var_turn < 0 THEN
        dbms_output.put_line(' ');
        dbms_output.put_line('Please enter a valid turn value.');
    ELSE
        IF var_turn = 0 THEN
            dbms_output.put_line(' ');
            dbms_output.put_line(' ');
            dbms_output.put_line('+-----------------------------------------------------------------------------------------------+');
            dbms_output.put_line(' ');
            dbms_output.put_line(' ');
            dbms_output.put_line('Starting new game.');
            clear_all_rows_proc();
        END IF;
    END IF;
END CHECK_TURN;
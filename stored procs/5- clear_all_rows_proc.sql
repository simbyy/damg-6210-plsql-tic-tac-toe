create or replace PROCEDURE CLEAR_ALL_ROWS_PROC AS 
BEGIN
    EXECUTE IMMEDIATE 'UPDATE TIC_TAC_TOE SET col1=''_'', col2=''_'', col3=''_''';
    EXECUTE IMMEDIATE 'UPDATE AVAILABLE_SPOTS SET turn=NULL';
    print_game('tic_tac_toe');
    dbms_output.put_line(' ');
END CLEAR_ALL_ROWS_PROC;
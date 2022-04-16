create or replace PROCEDURE PLAY_TIC_TAC_TOE_PROC 
(
  TURN IN NUMERIC DEFAULT NULL 
, RVAL IN VARCHAR2 DEFAULT NULL 
, CVAL IN VARCHAR2 DEFAULT NULL
) AS
VAR_TURN NUMERIC := nvl(TURN, -1);
VAR_RVAL VARCHAR2(5) := nvl(RVAL, ' ');
VAR_CVAL VARCHAR2(5) := nvl(CVAL, ' ');
VAR_PLAYER VARCHAR2(5) := 'O';
AVAILABLE_SPOT NUMERIC;
BEGIN
    DECLARE
    sql_statement varchar2(300);
    BEGIN
        IF MOD(TURN,2)=0 THEN
            VAR_PLAYER := 'X';
        END IF;
        IF VAR_TURN >= 0 THEN
            sql_statement:='UPDATE TIC_TAC_TOE SET ' || VAR_CVAL || ' = ''' || VAR_PLAYER || ''' WHERE cellId = ''' || VAR_RVAL || '''';
            EXECUTE IMMEDIATE(sql_statement);
            sql_statement:='update available_spots set turn='||VAR_TURN||' where c='''||var_cval||''' and r='''||var_rval||'''';
            EXECUTE IMMEDIATE(sql_statement);
        ELSE
            DBMS_OUTPUT.put_line('Please enter valid value for turn.');
        END IF;
    END;
    PRINT_GAME('tic_tac_toe');
END PLAY_TIC_TAC_TOE_PROC;
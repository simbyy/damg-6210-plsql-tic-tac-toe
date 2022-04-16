create or replace PROCEDURE SET_UP_GAMEBOARD AS 
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE TIC_TAC_TOE';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;
    BEGIN
        EXECUTE IMMEDIATE 'DROP TABLE AVAILABLE_SPOTS';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE != -942 THEN
                RAISE;
            END IF;
    END;
    DECLARE
    row1 varchar2(10);
    row2 varchar2(10);
    row3 varchar2(10);
    col1 varchar2(10);
    col2 varchar2(10);
    col3 varchar2(10);
    BEGIN
        row1:='row1';
        row2:='row2';
        row3:='row3';
        
        col1:='col1';
        col2:='col2';
        col3:='col3';
        
        EXECUTE IMMEDIATE 'CREATE TABLE TIC_TAC_TOE (cellId varchar(4), col1 varchar(1), col2 varchar(1), col3 varchar(1))';
        EXECUTE IMMEDIATE 'INSERT INTO TIC_TAC_TOE VALUES('''||row1||''', ''_'', ''_'', ''_'')';
        EXECUTE IMMEDIATE 'INSERT INTO TIC_TAC_TOE VALUES('''||row2||''', ''_'', ''_'', ''_'')';
        EXECUTE IMMEDIATE 'INSERT INTO TIC_TAC_TOE VALUES('''||row3||''', ''_'', ''_'', ''_'')';
        
        EXECUTE IMMEDIATE 'CREATE TABLE AVAILABLE_SPOTS(R varchar(4), C varchar(4), turn numeric)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row1||''', '''||col1||''', null)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row1||''', '''||col2||''', null)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row1||''', '''||col3||''', null)';
    
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row2||''', '''||col1||''', null)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row2||''', '''||col2||''', null)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row2||''', '''||col3||''', null)';
    
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row3||''', '''||col1||''', null)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row3||''', '''||col2||''', null)';
        EXECUTE IMMEDIATE 'INSERT INTO AVAILABLE_SPOTS VALUES('''||row3||''', '''||col3||''', null)';
        
        DBMS_OUTPUT.put_line('Gameboard ready.');
    END;
END SET_UP_GAMEBOARD;

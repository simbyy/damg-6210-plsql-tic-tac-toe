create or replace FUNCTION VALIDATIONS 
(
  TURN IN NUMBER 
, RVAL IN VARCHAR2 
, CVAL IN VARCHAR2 
) RETURN VARCHAR2 AS 
VAR_TURN NUMERIC := nvl(TURN, -1);
VAR_RVAL VARCHAR2(5) := nvl(RVAL, ' ');
VAR_CVAL VARCHAR2(5) := nvl(CVAL, ' ');
AVAILABLE_SPOT NUMERIC;
validation_flag numeric := 0;
BEGIN
    SELECT TURN INTO AVAILABLE_SPOT FROM AVAILABLE_SPOTS WHERE R = VAR_RVAL AND C = VAR_CVAL;
    if var_turn >= 0 then
        if lower(var_rval) = 'row1' or lower(var_rval) = 'row2' or lower(var_rval) = 'row3' then
            if lower(var_cval) = 'col1' or lower(var_cval) = 'col2' or lower(var_cval) = 'col3' then
                if available_spot is not null then
                    validation_flag := 1;
                    DBMS_OUTPUT.put_line('Please choose an unoccupied cell.');
                end if;
            else
                validation_flag := 1;
                DBMS_OUTPUT.put_line('Please enter valid value for column.');
            end if;
        else
            validation_flag := 1;
            DBMS_OUTPUT.put_line('Please enter valid value for row.');
        end if;
    else
        validation_flag := 1;
        DBMS_OUTPUT.put_line('Please enter valid value for turn.');
    end if;
    return validation_flag;
END VALIDATIONS;
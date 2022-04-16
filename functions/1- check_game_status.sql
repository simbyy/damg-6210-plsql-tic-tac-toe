create or replace FUNCTION CHECK_GAME_STATUS (
  TURN_IN IN NUMBER
) RETURN NUMERIC AS 
VAR_TURN_IN NUMERIC := nvl(TURN_IN, -1);
c11 varchar2(1) := '_';
c12 varchar2(1) := '_';
c13 varchar2(1) := '_';
c21 varchar2(1) := '_';
c22 varchar2(1) := '_';
c23 varchar2(1) := '_';
c31 varchar2(1) := '_';
c32 varchar2(1) := '_';
c33 varchar2(1) := '_';
game_status NUMERIC := 0;
empty_spots NUMERIC := 0;
BEGIN
    select count(*) into empty_spots from available_spots where turn is null;

    IF VAR_TURN_IN < 0 THEN
        dbms_output.put_line('Invalid turn input.');
        RETURN VAR_TURN_IN;
    ELSE
        select col1 into c11 from tic_tac_toe where cellId = 'row1';
        select col2 into c12 from tic_tac_toe where cellId = 'row1';
        select col3 into c13 from tic_tac_toe where cellId = 'row1';
        select col1 into c21 from tic_tac_toe where cellId = 'row2';
        select col2 into c22 from tic_tac_toe where cellId = 'row2';
        select col3 into c23 from tic_tac_toe where cellId = 'row2';
        select col1 into c31 from tic_tac_toe where cellId = 'row3';
        select col2 into c32 from tic_tac_toe where cellId = 'row3';
        select col3 into c33 from tic_tac_toe where cellId = 'row3';
        
        IF c11 = c12 and c12 = c13 and c11 != '_' THEN
            game_status := 1;
        ELSE
            IF c11 = c21 and c21 = c31 and c11 != '_' THEN
                game_status := 1;
            ELSE
                IF c11 = c22 and c22 = c33 and c11 != '_' THEN
                    game_status := 1;
                ELSE
                    IF c21 = c22 and c22 = c23 and c21 != '_' THEN
                        game_status := 1;
                    ELSE
                        IF c12 = c22 and c22 = c32 and c12 != '_' THEN
                            game_status := 1;
                        ELSE
                            IF c13 = c22 and c22 = c31 and c13 != '_' THEN
                                game_status := 1;
                            ELSE
                                IF c31 = c32 and c32 = c33 and c31 != '_' THEN
                                    game_status := 1;
                                ELSE
                                    IF c13 = c23 and c23 = c33 and c13 != '_' THEN
                                        game_status := 1;
                                    END IF;
                                END IF;
                            END IF;
                        END IF;
                    END IF;
                 END IF;
             END IF;
        END IF;
    
       IF game_status = 1 THEN
            IF MOD(VAR_TURN_IN, 2) = 0 THEN
                dbms_output.put_line(' ');
                dbms_output.put_line('Congratulations! X is the winner.');
            ELSE
                dbms_output.put_line(' ');
                dbms_output.put_line('Congratulations! O is the winner.');
            END IF;
            VAR_TURN_IN := 0;
       ELSE
            IF empty_spots > 0 THEN
                dbms_output.put_line(' ');
                dbms_output.put_line('Next player''s turn');
                VAR_TURN_IN := VAR_TURN_IN + 1;
            ELSE
                dbms_output.put_line(' ');
                dbms_output.put_line('Game over! It''s a tie.');
                VAR_TURN_IN := 0;
            END IF;
       END IF;
    END IF;
    RETURN VAR_TURN_IN;
END CHECK_GAME_STATUS;

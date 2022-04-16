set serveroutput on;

exec set_up_gameboard();

declare
turn numeric := 0;
validation_flag numeric := 0;
begin
    clear_all_rows_proc();
    
    DBMS_OUTPUT.put_line('Game demo 1');
    
    initiate_new_turn();
    select validations(turn, 'row1', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row1', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row1', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row1', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;

    initiate_new_turn();
    select validations(turn, 'row2', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    DBMS_OUTPUT.put_line('--Player tries to occupy an occupied cell--');
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
   DBMS_OUTPUT.put_line('Game demo 2');
   
    initiate_new_turn();
    select validations(turn, 'row1', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row1', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    DBMS_OUTPUT.put_line('User has added invalid input parameter for validations function');
       
    initiate_new_turn();
    select validations(null, 'row3', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    DBMS_OUTPUT.put_line('Game demo 3');

    initiate_new_turn();
    select validations(turn, 'row1', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row1', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row1', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row1', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    DBMS_OUTPUT.put_line('User enters invalid row value');
    initiate_new_turn();
    select validations(turn, 'row11', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row11', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row1', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row1', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row3', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row3', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col1') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col1');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col2') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col2');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
    
    initiate_new_turn();
    select validations(turn, 'row2', 'col3') into validation_flag from dual;
    if validation_flag=0 then
        play_tic_tac_toe_proc(turn, 'row2', 'col3');
        select check_game_status(turn) into turn from dual;
        check_turn(turn);
    end if;
end;
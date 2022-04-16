create or replace PROCEDURE INITIATE_NEW_TURN AS 
BEGIN
  DBMS_OUTPUT.put_line('Pick a row and column to make your move.');
  DBMS_OUTPUT.put_line('Available moves:');
  PRINT_GAME('available_spots');
END INITIATE_NEW_TURN;
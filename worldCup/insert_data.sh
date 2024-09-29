#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "INSERT INTO teams SUM(winner_goals) FROM games")"

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G

do
  #get ID of winning team
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  echo $WINNER_ID
  #if not found
  if [[ -z $WINNER_ID ]]
  then
    #write team name to table
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
  fi
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  #get ID of opponent
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  echo $OPPONENT_ID
  #if not found
  if [[ -z $OPPONENT_ID ]]
  then
    #write team name to table
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
  fi
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  ERASE_HEADER1=$($PSQL "DELETE FROM teams WHERE name='winner'")
  echo $ERASE_HEADER1
  ERASE_HEADER2=$($PSQL "DELETE FROM teams WHERE name='opponent'")
  echo $ERASE_HEADER2

  #Write games to games table
  INSERT_CURRENT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_G', '$OPPONENT_G')")
  echo $INSERT_CURRENT_GAME


done

#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv into worldcup database

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then

    #get team_id for opponent column
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # if team_id is not found
    if [[ -z $TEAM_ID ]]
    then
      INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams: $OPPONENT
      fi
    fi

    #get team_id for winner column
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # if team_id is not found
    if [[ -z $TEAM_ID ]]
    then
    # insert name of team into teams
      INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams: $WINNER
      fi
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
  # get winner_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  # get opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  # insert results into games
    INSERT_RESULTS=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_RESULTS == "INSERT 0 1" ]]
    then
      echo Inserted into games: $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
    fi
  fi
done
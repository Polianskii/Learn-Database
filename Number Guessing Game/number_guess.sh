#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

WELCOME() {
  echo -e "\nEnter your username:"
  read USERNAME
# get user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

  if [[ -z $USER_ID ]]
  then
# username has not been
    INSERT_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
# username has been
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(score) FROM games WHERE user_id = $USER_ID")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

NUMBER_GUESSING() {
echo -e "\nGuess the secret number between 1 and 1000:"
# generate random number
  SECRET_NUMBER=$(( RANDOM%1000 + 1 ))
# test info
  echo $SECRET_NUMBER
# initialising score
  SCORE=0
  while true
  do
# get user's number
    read NUMBER
    if [[ ! $NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      continue
    fi
# incrementing score  
    (( SCORE++ ))  
    if [[ $NUMBER -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    elif [[ $NUMBER -gt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $NUMBER -eq $SECRET_NUMBER ]]
    then
# insert score in database
      INSERT_SCORE=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $SCORE)")
      echo -e "\nYou guessed it in $SCORE tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    fi   
  done
}

WELCOME
NUMBER_GUESSING

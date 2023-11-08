#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username: "
read USERNAME

GUESSES=0
PLAYER_GUESS=0

#see if username exists
USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")
#echo $USERNAME_RESULT

#if it doesn't exist
if [[ -z $USERNAME_RESULT ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
#if it does
else
  echo $USERNAME_RESULT | while IFS="|" read USER_ID USERNAME
  do
    #echo $USER_ID $USERNAME
    USER_STATS_RESULTS=$($PSQL "SELECT games_played, best_game FROM user_stats WHERE user_id = $USER_ID")
    echo $USER_STATS_RESULTS | while IFS="|" read GAMES_PLAYED BEST_GAME
    do
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  done
fi

RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
#echo $RANDOM_NUMBER
echo "Guess the secret number between 1 and 1000:"

while [[ $PLAYER_GUESS -ne $RANDOM_NUMBER ]]
do
  read PLAYER_GUESS
  GUESSES=$((GUESSES+1))
  if [[ ! $PLAYER_GUESS =~ ^-?[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
  if [[ $PLAYER_GUESS -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    continue
  fi
  if [[ $PLAYER_GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    continue
  fi
done
#echo $GUESSES

#update user_stats with data
USERS_RESULT=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")

if [[ -z $USERS_RESULT ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  INSERT_USER_STATS_RESULT=$($PSQL "INSERT INTO user_stats(user_id, games_played, best_game) VALUES($USER_ID, 1, $GUESSES)")
else
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM user_stats WHERE user_id = $USER_ID")
  if [[ $BEST_GAME -gt $GUESSES ]]
  then
    BEST_GAME=$GUESSES
  fi
  UPDATE_USER_STATS_RESULTS=$($PSQL "UPDATE user_stats SET games_played = games_played + 1, best_game = $BEST_GAME WHERE user_id = $USER_ID")
fi

echo "You guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"

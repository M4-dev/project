#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_TO_GUESS=$(( $RANDOM%1000+1 ))
#echo $number_to_guess

echo "Enter your username:"
read USERNAME

USER_CHECK="$($PSQL "SELECT username FROM gamers WHERE username='$USERNAME';")"
if [[ -z $USER_CHECK ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_NEW_USER=$($PSQL "INSERT INTO gamers(username) VALUES('$USERNAME')")
  GAMER_ID=$($PSQL "SELECT gamer_id FROM gamers WHERE username='$USERNAME'")

else
  GAMER_ID=$($PSQL "SELECT gamer_id FROM gamers WHERE username='$USERNAME'")
  #for games played : count user id occurence
  GAMES_PLAYED=$($PSQL "SELECT COUNT(gamer_id) FROM games WHERE gamer_id=$GAMER_ID")
  
  BEST_GAME=$($PSQL "SELECT MIN(no_of_tries) FROM games WHERE gamer_id=$GAMER_ID")

  echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi


#game logic
TRIES=0
echo Guess the secret number between 1 and 1000:
until [[ $GUESS -eq $NUMBER_TO_GUESS ]]
#game starts
do
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    TRIES=$(($TRIES+1))

    if [[ $GUESS < $NUMBER_TO_GUESS ]]
    then
      echo "It's higher than that, guess again:"

    elif [[ $GUESS > $NUMBER_TO_GUESS ]]
    then
      echo "It's lower than that, guess again: "
    else
      echo You guessed it in $TRIES tries. The secret number was $NUMBER_TO_GUESS. Nice job!
      INSERT_GAME_PLAY=$($PSQL "INSERT INTO games(gamer_id, no_of_tries) VALUES ($GAMER_ID, $TRIES)")
    fi

  else
    echo That is not an integer, guess again:
  fi
done

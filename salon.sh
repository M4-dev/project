#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -tc"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

#display a numbered list of the services you offer before the first prompt
SERVICE_FUNC(){
  #If you pick a service that doesn't exist, you should be shown the same list of services again
  #check if exists
  S_ID_CHECK=$($PSQL "SELECT service_id FROM services WHERE service_id=$1")
  if [[ -z $S_ID_CHECK ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$1")

    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_CHECK=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_CHECK ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    fi
    echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME"
    read SERVICE_TIME
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

  fi

}


MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "$($PSQL "SELECT * FROM services")" |while read SERVICE_ID BAR NAME 
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICE_FUNC $SERVICE_ID_SELECTED
}

MAIN_MENU


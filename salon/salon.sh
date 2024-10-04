#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

# echo -e "\n~~~~ Welcome to Jay's Salon ~~~~\n"

# echo "I would be so very happy to help you today... hee hee"

# echo -e "\nHere's what are offering today:\n"

PRINT_MENU() {
  SALON_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SALON_SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}



MAIN_MENU() {
  SERVICES_ID_SELECTED=""
    PRINT_MENU
    read SERVICE_ID_SELECTED

    # check if 1,2,3,4
    case $SERVICE_ID_SELECTED in 
      1 | 2 | 3 | 4)
      echo -e "\nYour Phone Number?"
      read CUSTOMER_PHONE
      if [[ -z $CUSTOMER_PHONE ]]
      then
        echo "You did not enter a phone number"
      else 
        QUERY_DB_PHONE=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        if [[ -z $QUERY_DB_PHONE ]]
        then
          # phone not found -- get contact info and insert
          echo "What is your name?"
          read CUSTOMER_NAME
          INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        fi
        echo "What time would you like to visit?"
        read SERVICE_TIME
        QUERY_DB_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        QUERY_DB_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

        INSER_NEW_APPT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$QUERY_DB_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        QUERY_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
        echo "I have put you down for a" $QUERY_SERVICE "at" $SERVICE_TIME"," $QUERY_DB_NAME"."
        exit 0
      fi
      ;;
      *) 
      SERVICES_ID_SELECTED=""
      MAIN_MENU
      ;;
      esac

}

MAIN_MENU

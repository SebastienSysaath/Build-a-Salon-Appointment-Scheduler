#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

#Fonction Auxiliaire
classicProcedure(){
  echo -e "\nPhone number:" 
  read CUSTOMER_PHONE
  phoneCheck=$($PSQL "Select name from customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z "$phoneCheck" ]]
  then
    #not present in the data base
    echo -e "\nSeems like you're not in our database what'sName?" 
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
  fi

  echo -e "\nlength of service" 
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "Select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  $PSQL "INSERT INTO appointments(service_id, customer_id,time) VALUES('$SERVICE_ID_SELECTED', '$CUSTOMER_ID','$SERVICE_TIME')"
  serviceName=$($PSQL "Select name from services where service_id = $SERVICE_ID_SELECTED")
  customerName=$($PSQL "Select name from customers where customer_id = '$CUSTOMER_ID'")
  echo "I have put you down for a $serviceName at $SERVICE_TIME, $customerName."
}

mainMenu(){
  $PSQL "Select concat(service_id,') ', name) AS option from services"
  echo -e "\nPlease chose a services" 
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
      1) classicProcedure ;;
      2) classicProcedure ;;
      3) classicProcedure ;;
      *) mainMenu "Please enter a valid option." ;;
  esac

}
mainMenu








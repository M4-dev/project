PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
JOINT_LIST_PARSER(){
   if [[ -z $1 ]]
   then
      echo I could not find that element in the database.
   else
      echo $1 | while IFS="|" read ID A_N SYM NAME MASS MELT BOIL TYPE
      do
         echo "The element with atomic number $A_N is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
      done
   fi
}

if [[ -z $1 ]]
then
   echo "Please provide an element as an argument."
else
   if  [[ $1 =~ ^[0-9] ]]
   then
      ELEMENT_TO_GET=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
      if [[ -z $ELEMENT_TO_GET ]]
      then
         JOINT_LIST_PARSER
      else
         JOINT_LIST=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
         JOINT_LIST_PARSER $JOINT_LIST
      fi
   elif [[ $1 =~ [A-Z]$|[A-Z].$ ]]
   then
      ELEMENT_TO_GET=$($PSQL "SELECT * FROM elements WHERE symbol='$1'")
      if [[ -z $ELEMENT_TO_GET ]]
      then
         JOINT_LIST_PARSER
      else
         JOINT_LIST=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1'")
         JOINT_LIST_PARSER $JOINT_LIST
      fi
   else
      ELEMENT_TO_GET=$($PSQL "SELECT * FROM elements WHERE name='$1'")
      if [[ -z $ELEMENT_TO_GET ]]
      then
         JOINT_LIST_PARSER
      else
         JOINT_LIST=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$1'")
         JOINT_LIST_PARSER $JOINT_LIST
      fi
   fi

fi



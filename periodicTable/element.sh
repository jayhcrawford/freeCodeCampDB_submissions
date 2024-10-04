PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

not_found() {
  echo "I could not find that element in the database."
  return 0
}

check_atom_num_match() {
  QUERY_DB_NUM=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number='$1'")
  if [[ -z $QUERY_DB_NUM ]]
  then
    exit 0
  else
    echo $QUERY_DB_NUM
  fi
}

check_sym_string_match() {
  QUERY_DB_NAME=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
  QUERY_DB_SYM=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
  if [[ -z $QUERY_DB_SYM && -z $QUERY_DB_NAME ]]
  then
    exit 0
  else 
    if [[ -z $QUERY_DB_SYM ]]
    then
      echo $QUERY_DB_NAME
    else
      echo $QUERY_DB_SYM
    fi
  fi
}

stringify_results() {
  echo "$1" | while IFS="|" read TYP_ID ATOM_NUM BP_CELS MP_CELS AMU SYM NAME TYPE
  do
    atom_sym_sed=$(echo "("$SYM")." | sed -E 's/ //g')
    echo "The element with atomic number" $ATOM_NUM "is" $NAME $atom_sym_sed" It's a" $TYPE", with a mass of" $AMU "amu." $NAME "has a melting point of" $BP_CELS "celsius and a boiling point of" $MP_CELS "celsius."
  done
}


if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
else
  if [[ $1 =~ ^-?[0-9]+$ ]]
  then
    CHECK=$(check_atom_num_match "$1")
    stringify_results "$CHECK"
  else
    CHECK=$(check_sym_string_match "$1")
      if [[ -z $CHECK ]]
      then
        # fail, string not found
        not_found
      else
        # success, string found
        stringify_results "$CHECK"
      fi
  fi

fi
# SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id);



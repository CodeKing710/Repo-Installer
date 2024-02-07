#!/bin/bash

###### passwdgen ######
# Generates Passwords #
# Can take plaintext, #
# uncased, passwords  #
# and convert them to #
# secure passwords!   #
#######################

# rules=( "s/e/3/", "s/a/@/", "s/A/4/", "s/l/1/", "s/L/7/", "s/s/5/", "s/ex/!/", "s/o/0/", "s/q/0/" )
rules=()

# randCase() {
#   local pass="${1,,}" #Perform lowercasing again to ensure lowercase
#   local convertPass=""
#   echo "randCase recieved: $pass"
#   for char in $pass; do
#     echo "Character: $char"
#     if (( $RANDOM % 2 == 0 )); then
#       convertPass+="${char^^}"
#     else
#       convertPass+="$char"
#     fi
#   done
#   echo $convertPass
# }
# genPass() {}
convertPass() {
  # local pass=`randCase "${1,,}"`
  local pass="${1,,}"
  echo "Before: $pass"
  for rule in $rules; do
    # pass=`echo "$pass" | sed "$rule"`
    echo "Rule: $rule"
    pass="`echo "$pass" | tr -s $rule`"
  done
  echo "After: $pass"
  # local convertPass=""
  # echo "convertPass recieved: $pass"
  # for char in $pass; do
  #   echo "Character: $char"
  #   for rule in $rules; do
  #     convertPass+=`echo "$char" | sed -E "$rule"`
  #   done
  # done
  # echo $convertPass
}

echo "PasswdGen v1.0"

while true; do
  read -p "Enter password to convert: " pass

  [[ `echo "$pass" | grep -E "cancel|exit|quit"` != "" ]] && exit

  # [[ "$pass" == "gen" ]] && $(genPass; continue) || [[ "$pass" == "" ]] && $(echo "Please enter a value"; continue) || $(convertPass; continue)
  if [[ "$pass" == "gen" ]]; then
    echo "`genPass $pass`"
  elif [[ "$pass" == "" ]]; then
    echo "Please enter a value"
    continue
  else
    echo "`convertPass $pass`"
  fi
done
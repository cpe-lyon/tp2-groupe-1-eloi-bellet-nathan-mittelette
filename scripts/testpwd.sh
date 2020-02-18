#!/bin/bash
#Set password value
PASSWORD="test"
# Read Password
echo -n "Password : " 
read -s currentpassword
# Comparaison
if [ "$currentpassword" = "$PASSWORD" ]; then 
    echo "Bien joué"
else 
    echo "Perdu"
fi 
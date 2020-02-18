#!/bin/bash

#function de test
function is_number() {
    re='^[+-]?[0-9]+([.][0-9]+)?$'
    if ! [[ $1 =~ $re ]]; then
        return 1
    else
        return 0
    fi
}

#exécution de la fonction
is_number
echo $?
#test sur le résultat de la fonction
if [ $? == "1" ]; then
    echo "C'est un nombre"
else 
    echo "Ce n'est pas un nombre"
fi



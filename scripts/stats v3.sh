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

declare -a array
while [ 1 -eq 1 ]; do
    # Récupération de la saisi utilisateur
    echo -n "Votre nombre (STOP pour arrêter) : "
    read currentNumber

    if [ $currentNumber == "STOP" ]; then
        break
    fi

    is_number $currentNumber
    if [ $? == "1" ]; then
        echo $currentNumber "n'est pas un nombre"
    else
        array+=($currentNumber)
    fi
done

echo ${array[@]}

min=0
max=0
moyenne=0
i=1
for var in "${array[@]}"; do
    if [ $i -eq 1 ]; then
        min=$var
        max=$var
        moyenne=$((moyenne + $var))
    else
        if [ $var -lt $min ]; then
            min=$var
        elif [ $var -gt $max ]; then
            max=$var
        fi
        moyenne=$((moyenne + $var))
    fi
    i=$((i + 1))
done

i=$((i - 1))
moyenne=$((moyenne / $i))

echo min : $min
echo max : $max
echo moyenne : $moyenne

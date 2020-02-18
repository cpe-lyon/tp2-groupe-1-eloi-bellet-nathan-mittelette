#!/bin/bash

number=$((RANDOM % 1000 + 1))
echo $number

while [ 1 -eq 1 ]; do
    echo -n "Votre nombre : "
    read currentNumber
    if [ $currentNumber -gt $number ]; then
        echo "Plus petit !"
    elif [ $currentNumber -lt $number ]; then
        echo "Plus grand !"
    else
        echo "Trouvé !"
        break
    fi
done

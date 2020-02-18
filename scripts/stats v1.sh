#!/bin/bash

if [ $# -ne 3 ]; then
    echo "3 arguments sont requis"
    exit 1
fi

#function de test
function is_number() {
    re='^[+-]?[0-9]+([.][0-9]+)?$'
    if ! [[ $1 =~ $re ]]; then
        return 1
    else
        return 0
    fi
}

min=0
max=0
moyenne=0
i=1
for var in "$@"; do
    is_number $var
    if [ $? == "1" ]; then
        echo $var "n'est pas un nombre"
        exit 1
    else
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

    fi
    i=$((i + 1))
done

i=$((i - 1))
moyenne=$((moyenne / $i))

echo min : $min
echo max : $max
echo moyenne : $moyenne
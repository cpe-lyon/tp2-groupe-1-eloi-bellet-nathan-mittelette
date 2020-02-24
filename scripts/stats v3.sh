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

    # Si jamais c'est la dernière saisie
    if [ $currentNumber == "STOP" ]; then
        break
    fi

    # Si jamais c'est un nombre on l'ajout auj tableau
    is_number $currentNumber
    if [ $? == "1" ]; then
        echo $currentNumber "n'est pas un nombre"
    else
        array+=($currentNumber)
    fi
done

# Affichage du tableau
echo ${array[@]}

min=0
max=0
moyenne=0
i=1
for var in "${array[@]}"; do
    # Si jamais c'est la première itération de la boucle
    if [ $i -eq 1 ]; then
        min=$var
        max=$var
        moyenne=$((moyenne + $var))
    else
    # Sinon si jamais il est plus petit que le minimum on le remplace
        if [ $var -lt $min ]; then
            min=$var
    # Si jamais il est plus grand que le max on le remplace
        elif [ $var -gt $max ]; then
            max=$var
        fi
    # On le rajoute à la moyenne pour la calculer après
        moyenne=$((moyenne + $var))
    fi
    i=$((i + 1))
done

# Calcul de la moyenne
i=$((i - 1))
moyenne=$((moyenne / $i))

# Affichage
echo min : $min
echo max : $max
echo moyenne : $moyenne

#!/bin/bash

# On définit le nomber aléatoire enter 1000 et 1
number=$((RANDOM % 1000 + 1))

# Création d'une boucle infini tant que l'utilisateur ne trouve pas
while [ 1 -eq 1 ]; do
    # Récupération de la saisi utilisateur
    echo -n "Votre nombre : "
    read currentNumber
    # Si jamais le nombre est plus petit on l'affiche
    if [ $currentNumber -gt $number ]; then
        echo "Plus petit !"
    #Si jamais le nombre est plus grand on l'affiche
    elif [ $currentNumber -lt $number ]; then
        echo "Plus grand !"
    # Si jamais le nombre est le même on l'affiche et on quitte la boucle
    else
        echo "Trouvé !"
        break
    fi
done

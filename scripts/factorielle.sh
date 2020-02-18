#!/bin/bash

# Gestion du cas ou il n'y a pas de paramètre pour la commaned
if [ "$1" == "" ]; then
    echo Veuillez saisir un paramètre
    exit 1
fi

# On initialise le conteur à 1 et la factorielle à 1
counter=$1
factorial=1

# Tant que le compteur est plus grand que 0 on multiplie 
# factoriel par le compteur et on le décrémente
while [ $counter -gt 0 ]
do
   factorial=$(( $factorial * $counter ))
   counter=$(( $counter - 1 ))
done

# Affichage du résultat
echo $factorial
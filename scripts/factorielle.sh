#!/bin/bash

if [ "$1" == "" ]; then
    echo Veuillez saisir un paramêtre
    exit 1
fi

counter=$1
factorial=1
while [ $counter -gt 0 ]
do
   factorial=$(( $factorial * $counter ))
   counter=$(( $counter - 1 ))
done
echo $factorial
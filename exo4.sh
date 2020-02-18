#!/bin/bash

if [ "$1" == "" ]; then
    echo Utilisation : $0 nom_utilisateur
    exit 1
fi

if compgen -u | grep -q -w $1 ; then
    echo L\'utilisateur existe
    exit 0
else
    echo L\'utilisateur n\'existe pas
    exit 1
fi

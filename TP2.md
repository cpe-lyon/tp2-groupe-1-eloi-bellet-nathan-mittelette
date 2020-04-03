## Nathan Mittelette - Eloi Bellet

# TP 2 - Bash

### Exercice 1. Variables d’environnement

1) Dans quels dossiers `bash` trouve-t-il les commandes tapées par l’utilisateur ?

> /home/myuser/.bash_history.

2) Quelle variable d’environnement permet à la commande `cd` tapée sans argument de vous ramener dans votre répertoire personnel?
> C'est la variable d'environnement `$HOME`.

3) Explicitez le rôle des variables `LANG`,`PWD`,`OLDPWD`,`SHELL` et `_.`

> - `$LANG` est la variable qui stocke la langue courante.
> - `$PWD` est la variable qui contient le chemin courant.
> - `$OLDPWD` l'ancien chemin courant.
> - `$SHELL` le chemin vers la commande shell.
> - `$_.` contient tous les noms de fichier absolu du shell ou du script qui a été exécuter.

4) Créez une variable locale MY_VAR (le contenu n’a pas d’importance). Vérifiez que la variable existe.

> `MY_VAR=test` puis `set | grep MY_VAR` elle existe.

5) Tapez ensuite la commande `bash`. Que fait-elle? La variable `MY_VAR` existe-t-elle? Expliquez. A la fin de cette question, tapez la commande `exit` pour revenir dans votre session initiale.

> Après avoir tapé la commande bash, la variable MY_VAR n'existe plus. La commande `bash` permet de créer un fils au terminal, la variable local n'est donc pas transféré.

6) Transformez `MY_VAR` en une variable d’environnement et recommencez la question précédente. Expliquez

> `export MY_VAR=test`. Après avoir tapé la commande `bash`, printenv MY_VAR renvoie bien `test` car les variables d'environnements sont bien transféré.

7) Créer la variable d’environnement `NOMS` ayant pour contenu vos noms de binômes séparés par un espace.Aﬀicher la valeur de `NOMS` pour vérifier que l’affectation est correcte.

> `export NOMS="BELLET MITTELETTE"`  et `printenv NOMS`.

8) Ecrivez une commande qui aﬀiche ”Bonjour à vous deux, binôme1 binôme2!” (où binôme1 et binôme2 sont vos deux noms) en utilisant la variable `NOMS`

> `echo "Bonjour à vous deux, $NOMS"`.

9) Quelle différence y a-t-il entre donner une valeur vide à une variable et l’utilisation de la commande `unset` ?

> unset détruit la variable alors au lieu de lui donner un contenu vide.

10) Utilisez la commande `echo` pour écrire `exactement` la phrase :$HOME =chemin (où chemin est votre dossier personnel `d’après bash`)

> `echo \$HOME = $HOME`.

## Programmation Bash

Vous enregistrerez vos scripts dans un dossier `script` que vous créerez dans votre répertoire personnel. Tous les scripts sont bien entendu à tester.
Ajoutez le chemin vers `script` à votre `PATH` de manière permanente.

> export PATH=/home/user/scripts:$PATH \
> Les scripts sont stockés dans le dossier `scripts`.

### Exercice 2. Contrôle de mot de passe

Écrivez un script `testpwd.sh` qui demande de saisir un mot de passe et vérifie s’il correspond ou non au contenu d’une variable `PASSWORD` dont le contenu est codé en dur dans le script. Le mot de passe saisi par l’utilisateur ne doit pas s’aﬀicher.

> - Nom du script : `testpwd.sh`.

``` bash
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
```

### Exercice 3. Expressions rationnelles

Ecrivez un script qui prend un paramètre et utilise la fonction suivante pour vérifier que ce paramètre est un nombre réel :


``` bash
function is_number()
{
    re='^[+-]?[0-9]+([.][0-9]+)?$'
    if ! [[ $1 =~ $re ]] ; then
    return 1
    else
    return 0
    fi
}
```

Il aﬀichera un message d’erreur dans le cas contraire.

> - Nom du script : `isAN.sh`.

``` bash
#!/bin/bash

if [ "$1" == "" ]; then
    echo Veuillez saisir un paramètre
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

#exécution de la fonction
is_number $1
#test sur le résultat de la fonction
if [ $? == "1" ]; then
    echo "Ce n'est pas un nombre"
else
    echo "C'est un nombre"
fi
```

### Exercice 4. Contrôle d’utilisateur

Écrivez un script qui vérifie l’existence d’un utilisateur dont le nom est donné en paramètre du script. Si le script est appelé sans nom d’utilisateur, il aﬀiche le message : ”Utilisation :nom_du_scriptnom_utilisateur”, où `nom_du_script` test le nom de votre script récupéré automatiquement (si vous changez le nom de votre script, le message doit changer automatiquement)

> - Nom du script ; `userControl.sh`.

``` bash
#!/bin/bash

# Dans le cas ou la chaine est vide
if [ "$1" == "" ]; then
    echo Utilisation : $0 nom_utilisateur
    exit 1
fi

# Vérification que l'utilisateur existe via compgen
if compgen -u | grep -q -w $1 ; then
    echo L\'utilisateur existe
    exit 0
else
    echo L\'utilisateur n\'existe pas
    exit 1
fi
```

### Exercice 5. Factorielle

Écrivez un programme qui calcule la factorielle d’un entier naturel passé en paramètre (on supposera quel’utilisateur saisit toujours un entier naturel).

> - Nom du script ; `factorielle.sh`.

``` bash
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
```

### Exercice 6. Le juste prix

Écrivez un script qui génère un nombre aléatoire entre 1 et 1000 et demande à l’utilisateur de le deviner.Le programme écrira ”C’est plus!”, ”C’est moins!” ou ”Gagné!” selon les cas (vous utiliserez `$RANDOM`).

> - Nom du script : `plusOuMoins.sh`.

``` bash
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
```

### Exercice 7. Statistiques

1) Écrivez un script qui prend en paramètres trois entiers (entre -100 et +100) et aﬀiche le min, le max et la moyenne. Vous pouvez réutiliser la fonction de l’exercice 3 pour vous assurer que les paramètres sont bien des entiers.

> - Nom du script : `stats v1.sh`.

``` bash
#!/bin/bash

# test si jamais il y a 3 arguments
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
    # Test si jamais c'est bien un nombre
    if [ $? == "1" ]; then
        echo $var "n'est pas un nombre"
        exit 1
    else
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
```

2) Généralisez le programme à un nombre quelconque de paramètres (pensez à `SHIFT`)

> - Nom du script : `stats v2.sh`.

``` bash
#!/bin/bash

# function de test
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
    # Test si jamais c'est bien un nombre
    if [ $? == "1" ]; then
        echo $var "n'est pas un nombre"
        exit 1
    else
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
```

3) Modifiez votre programme pour que les notes ne soient plus données en paramètres, mais saisies et stockées au fur et à mesure dans un tableau.


> - Nom du script : `stats v3.sh`.

``` bash
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

```
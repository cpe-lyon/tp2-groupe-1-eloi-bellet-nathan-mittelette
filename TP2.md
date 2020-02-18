# TP 2 - Bash

### Exercice 1. Variables d’environnement

1) /home/myuser/.bash_history
2) C'est la variable d'environnement `$HOME`

3)  - `$LANG` est la variable qui stocke la langue courante
     - `$PWD` est la variable qui contient le chemin courant
     - `$OLDPWD` l'ancien chemin courant
     - `$SHELL` le chemin vers la commande shell
     - `$_.` contient tous les noms de fichier absolu du shell ou du script qui a été exécuter

4) `MY_VAR=test` puis `set | grep MY_VAR` elle existe
5) Après avoir tapé la commande bash, la variable MY_VAR n'existe plus. La commande `bash` 
6) `export MY_VAR=test`. Après avoir tapé la commande `bash`, printenv MY_VAR renvoie bien `test`
7) `export NOMS="BELLET MITTELETTE"`  et `printenv NOMS`
8) `echo "Bonjour à vous deux, $NOMS"` 
9) unset détruit la variable alors que l'autre donne seulement un contenu vide.
10) `echo \$HOME = $HOME`

## Programmation Bash

export PATH=/home/user/scripts:$PATH

Les scripts sont stockés dans le dossier `scripts`

# Exercice 2. Contrôle de mot de passe

- Nom du script : `testpwd.sh`

# Exercice 3. Expressions rationnelles

- Nom du script : `isAN.sh`

# Exercice 4. Contrôle d’utilisateur

- Nom du script ; `exo4.sh`
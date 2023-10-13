#! /bin/bash

#####################################
#       Vincent Del Ciotto          #
#           Script 0.1              #
#Création de 3 utilisateur simultané# 
# 	  le 13/10/2023             #
#####################################

#Le script ci-dessous permettra de créé 3 utilisateur simultanément


####################Etablissement des variables#####################
#pas de variable utilisation d'argument !

###################Etablissement des fonctions######################
#pas de fonction pour l'instant

#############################Main###################################
#verification argument non vide
if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ]
then
	echo "Il manque les noms d'utilisateurs en argument - Fin du script"
	exit 1
#verification existance utilisateur
else
	if cat /etc/passwd | grep "$1" > /dev/null
	then
		echo "L'utilisateur $1 existe déjà"
		exit 1
	else
		if cat /etc/passwd  | grep "$2" > /dev/null
		then 
			echo " L'utilisateur $2 existe déja"
			exit 1
		else
			if cat /etc/passwd | grep "$3" > /dev/null
			then 
				echo " L'utilisateur $3 existe déja"
				exit 1
			else
#création des 3 utilisateur
		useradd $1 && useradd $2 && useradd $3 && echo "Les utilisateurs $1 $2 $3 ont été crées avec succès"
			fi
		fi		
	fi
fi

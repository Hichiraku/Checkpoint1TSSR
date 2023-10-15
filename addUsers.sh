#! /bin/bash

#####################################
#       Vincent Del Ciotto          #
#           Script 0.1              #
#Création d'utilisateur simultané   # 
# 	  le 13/10/2023             #
#####################################

#Le script ci-dessous permettra de créé 3 utilisateur simultanément


####################Etablissement des variables#####################
#pas de variable utilisation d'argument !

###################Etablissement des fonctions######################
#pas de fonction pour l'instant

#############################Main###################################
if [ -z $1 ]
then
	echo "Il manque les noms d'utilisateurs en argument - Fin du script" 
	exit 1
else
	for user in $*
	do
		if cat /etc/passwd | grep $user > /dev/null
		then 
			echo "L'utilisateur $user existe déjà"
			exit 1
		else
			useradd $user &&  echo "L'utilisateur $user a été crée"
			exit 0
		fi
	done
fi


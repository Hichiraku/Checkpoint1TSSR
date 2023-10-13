
Question 1

L'une des commandes pour lister des utilisateurs d'un système linux est la suivante :

``` bash
cut -d: -f1 /etc/passwd
```

Question 2 

La commande permettant de changer les droits du fichier **myfile** en rwxr--r-- 

``` bash
chmod 744 myfile
```

Question 3

Pour faire en sortent que les fichiers pdf d'un dépot local git ne soient pas pris en compte lors d'un **git push**, nous devons ajouter au répertoire un fichier **.gitignore** dans lequel on écrira la ligne suivante :

``` bash
*.pdf
```

Question 4

Pour fusionner les branches **main** et **test_valide**, il faut être sur la branche **test_valide** et utiliser la commande 

``` bash
git merge main
```

Question 5
Voici la ligne de code pour afficher le texte :

``` bash
echo -e 'Malgré le prix élevé de 100$, il a dit "Bonjour !" au vendeur :\n- "Bonjour est-ce que ce clavier fonctionne bien ?" \n- "Evidemment ! On peut tout écrire avec, que ce soit des pipe | ou bien des backslash \\\\ !" \n- "Même des tildes ~ ?" \n- "Evidemment !"'
```

Question 6

la commande qui me permet de mettre en avant le processus gedit est : 

``` bash
fg gedit
```

Question 7

Les matériels réseaux sur la couche 2 du modèle OSI sont :
Le pont : il permet de relier deux réseaux

Les matériels résaux sur la couche 3 du modèle OSI sont :
Le routeur : c'est l'appareil qui va gerer le cheminement des paquets

Question 8

Les equivalents des commandes suivant Powershell sont :
* La commande CD en shell devient Set-Location en powershell
- La commande CP en shell devient Copy-Item en powershell
- La commande MKDIR en shell devient New-Item -directory en powershell 
- La commande LS en shell devient Get-ChildItem

Question 9

Le payload contient les données du transfert des paquets

Question 10

Les classes IP ont été remplacés par le CIDR car les besoins des reseaux n'était pas adapté au catégorie de classe, le CIDR permet d'adapter le réseaux à notre parc matériel.
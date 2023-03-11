# Projet Démineur

Ce projet rentre dans le cadre du cours de HAX815X - Programmation R.

Le but est de créer une bibliothèque R permettant de jouer au démineur.

## Règles du jeu

Les règles du jeu sont les suivantes :

-   vous commencez par choisir le niveau de difficulté du jeu qui permettra de déterminer le nombre de bombes à placer dans la grille de démineur

-   vous choisissez une case à révéler. Si celle-ci contient une bombe, la partie se termine et vous avez perdu. Si la case choisie ne contient pas de bombe, dans ce cas là un numéro apparaitra sur cette dernière, il correspondra alors au nombre de bombes adjacentes à cette case.

## Les fonctions

-   le fichier R `jeu_tout_seul.R` contient une fonction `jeu_seul()` qui lance une partie de démineur où les cases à révéler sont choisies au hasard par l'ordinateur. Vous pouvez cependant choisir le niveau de difficulté et le nombre de cases que vous souhaitez faire ouvrir par l'ordinateur.

-   le fichier R `case_revelation.R` contient une fonction `case_revel()` qui permet de révéler une case choisie par l'opérateur dans la grille de démineur.

-   le fichier R `grille_crea.R` contient deux fonctions : `crea_vide()` qui crée une matrice de taille 15x15 remplie de tournesols et `creation_grille()` qui crée une matrice de démineur de taille 15x15 remplie de mines .

-   le fichier R `app.R` contient les deu fonctions server et ui pour l'application shiny.

## Exemples

<p align="center">
  <img src="https://github.com/paulinedusfourcastan/Programmation-R-/blob/main/img1.png" width=200 title="dem">
</p>


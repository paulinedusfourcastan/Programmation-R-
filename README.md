# Projet Démineur

Ce projet rentre dans le cadre du cours de HAX815X - Programmation R.

Le but est de créer une bibliothèque R permettant de jouer au démineur.

## Règles du jeu

Les règles du jeu sont les suivantes :

-   vous commencez par choisir le niveau de difficulté du jeu, c'est à dire la taille de grille que vous souhaitez ainsi que le nombre de bombes à placer.

-   vous choisissez une case à révéler. Si celle-ci contient une bombe, la partie se termine et vous avez perdu. Si la case choisie ne contient pas de bombe, dans ce cas là un numéro apparaitra sur cette dernière, il correspondra alors au nombre de bombes adjacentes à cette case.

-   vous pouvez également placer un drapeau puis le retirer à tout moment.

## Les fonctions

-   le fichier R `jeu_tout_seul.R` contient une fonction `jeu_seul()` qui lance une partie de démineur où les cases à révéler sont choisies au hasard par l'ordinateur. Vous pouvez cependant choisir le niveau de difficulté, la taille de la grille et le nombre de cases que vous souhaitez faire ouvrir par l'ordinateur.

-   le fichier R `case_revelation.R` contient une fonction `case_revel()` qui permet de révéler une case choisie par l'opérateur dans la grille de démineur.

-   le fichier R `grille_crea.R` contient deux fonctions : `crea_vide()` qui crée une matrice de taille NxN remplie de tournesols et `creation_grille()` qui crée une matrice de démineur de taille NxN remplie de mines .

-   le fichier R `app.R` contient les deux fonctions `server()` et `ui()` pour lancer l'application shiny.

-   le fichier R `drapeau_pose.R` contient les fonctions pour poser un drapeau (`place_drap()`) et enlever un drapeau posé (`deplace_drap()`).

## Exemples

Voilà comment se présente de base l'interface de jeu après que vous ayez choisi la taille de la grille de jeu et le nombre de bombes :

<p align="center">

<img src="https://github.com/paulinedusfourcastan/Programmation-R-/blob/main/img2.png" title="dem" width="600"/>

</p>

Lorsque vous ouvrez des cases, voilà ce que vous obtenez :

<p align="center">

<img src="https://github.com/paulinedusfourcastan/Programmation-R-/blob/main/img3.png" title="dem" width="600"/>

</p>

Si vous ouvrez une case contenant une bombe, le jeu s'arrête et la grille de jeu finie apparaît :

<p align="center">

<img src="https://github.com/paulinedusfourcastan/Programmation-R-/blob/main/img4.png" title="dem" width="600"/>

</p>

## Contact

Pauline Dusfour-Castan : [pauline.dusfourcastan\@gmail.com](mailto:pauline.dusfourcastan@gmail.com){.email}

Sofiane Aoues : [aoues.sofiane\@outlook.com](mailto:aoues.sofiane@outlook.com){.email}

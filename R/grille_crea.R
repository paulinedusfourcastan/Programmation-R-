library(emoji)
library(gridExtra)
library(emojifont)
library(dplyr)
library(tidyverse)

# Fonction pour l'affichage du début
# creation d'une matrice de taille NxN avec des tournesols

crea_vide <- function(nv, taille){
  grille <- matrix(data =paste0(emoji("sunflower"),1:(taille^2)), nrow = taille, ncol = taille)
  grille
  
}


# Fonction pour : 
# 1) créer la grille de démineur
# 2) générer des bombes placées aléatoirement 
# 3) afficher sur les cases où il n'y a pas de bombes, le nombre de bombes adjacentes

# nb_bomb = nombre de bombes 
# taille = taille de la grille choisie

creation_grille <- function(nb_bomb, taille){
  
  # on génère une matrice de 0 de taille NxN
  grille <- matrix(data = 0, nrow = taille, ncol = taille) 
  
  # on donne des coordonnées aléatoires aux bombes  
  bomb_coord <- sample(1:nrow(grille)^2, size = nb_bomb, replace=FALSE) 
  
  # on donne la valeur -6 aux cases qui contiendront une bombe
  grille[bomb_coord] <- -6  
  
  # on ajoute des deux colonnes et deux lignes aux extrémités pour ne pas avoir de problèmes de bordures pour calculer les voisins
  # on obtient une matrice N+2xN+2
  grille.pad <- rbind(NA, cbind(NA, grille, NA), NA)  
  
  ind <- 2:(nrow(grille) + 1) # on decale les coord vers la droite 
  
  # pour chaque case on crée une ligne qui contiendra ce qui se trouve au dessus, en dessous, à droite, à gauche et celles des angles 
  vois <- rbind(H  = as.vector(grille.pad[ind - 1, ind    ]), # pour le haut 
                HD = as.vector(grille.pad[ind - 1, ind + 1]), # pour le coin haut droit 
                D  = as.vector(grille.pad[ind    , ind + 1]), # pour la droite 
                BD = as.vector(grille.pad[ind + 1, ind + 1]), # pour le coin bas droit 
                B  = as.vector(grille.pad[ind + 1, ind    ]), # pour le bas 
                BG = as.vector(grille.pad[ind + 1, ind - 1]), # pour le coin bas gauche 
                G  = as.vector(grille.pad[ind    , ind - 1]), # pour la gauche 
                HG = as.vector(grille.pad[ind - 1, ind - 1])) # pour le coin haut gauche 
  
  # on remplace -6 dans vois par 1 
  vois[vois == -6] <- 1
  
  # pour chaque case, on somme le nb de 1 présent dans la colonne de vois, ce qui nous donnera le nombre de mines voisines à cette case
  vois2 <- colSums(vois, na.rm = TRUE)
  
  # on prend les cases qui ont des voisins mines et qui ne sont pas une mine
  voisi_mines <- which(vois2 != 0 & grille!=-6)
  
  # on affecte le nb de mines voisines aux cases sélectionnées au dessus 
  grille[voisi_mines] <- vois2[voisi_mines]
  
  grille
}



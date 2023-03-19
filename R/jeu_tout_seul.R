library(emoji)
library(emojifont)

source("grille_crea.R")
source("case_revelation.R")

# Fonction qui joue au démineur seule 

# nb_bomb = nombre de bombes
# nb_part = nombre de case que l'on veut que l'ordi revele
# taille = taille de la grille 

jeu_seul <- function (nb_bomb, nb_part, taille){

  
  gg_d <- creation_grille(nb_bomb, taille)
  
  A <- crea_vide(nb_bomb, taille)
  
  for (i in 1:nb_part){
    n <- sample(1:taille^2, size = 1)
    print(n)
    if (gg_d[n]!=-6){
      A <- case_revel(n, A, gg_d)
      
      print(A) 
    }
    if(gg_d[n]==-6) {
      
      print(emoji("bomb"))
      print("PERDU !!!") 
      break
    }
    print(i)
  }
  
}



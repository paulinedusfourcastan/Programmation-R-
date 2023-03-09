library(emoji)
library(ggplot2)

source("grille_crea.R")
source("case_revelation.R")

# Fonction qui joue au démineur seule 

# nv = niveau de difficulté
# nb_part = nombre de case que l'on veut que l'ordi revele 

jeu_seul <- function (nv, nb_part){
  N <- 15
  
  if(nv==1){nb_bomb<-50}
  if(nv==2){nb_bomb<-70}
  if(nv==3){nb_bomb<-100}
  
  gg_d <- creation_grille(nv)
  
  A <- crea_vide(nv)
  
  for (i in 1:nb_part){
    n <- sample(1:225, size = 1)
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
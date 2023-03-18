library(emoji)
library(emojifont)
library(dplyr)

# Fonction qui révèle la valeur d'une case

# case_id = numéro de la case que l'on veut ouvrir
# grille1 = grille vide créée avec crea_vide()
# grille2 = grille de démineur créée avec creation_grille()

case_revel <- function(case_id, grille1, grille2){
  t <- nrow(grille1)
  
  # dans le cas des bombes 
  # on affecte un emoji bombe à toutes les cases bombes et on retourne la matrice finale 
  if (grille2[case_id]== -6){
    grille1[case_id] <- emoji("bomb")
    for (i in (1:t^2)){
      if (grille2[i]== -6){
        grille2[i] <- emoji("bomb")
      }
    }

    return(grille2)
  }
  
  # dans le cas voisin = bombe
  # on revele le nombre de bombes voisines à cette case 
  if (grille2[case_id]!= -6  & grille2[case_id]!=0){
    grille1[case_id] <- grille2[case_id]
    return(grille1)
  }
  
  # dans le cas pas de voisin bombe
  # il faut reveler la valeur des cases autour 
  if (grille2[case_id]==0){
    
    # coin haut gauche
    if (case_id==1){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id + 1] <- grille2[case_id +1]
      grille1[case_id + t] <- grille2[case_id +t]
      grille1[case_id + t+1] <- grille2[case_id +t+1]
      return(grille1)
    }
    # coin bas gauche
    if(case_id == t){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id - 1] <- grille2[case_id -1]
      grille1[case_id + t] <- grille2[case_id +t]
      grille1[case_id + t -1] <- grille2[case_id +t-1]
      return(grille1)
    }
    # coin bas droit
    if (case_id == t^2){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id - 1] <- grille2[case_id -1]
      grille1[case_id - t] <- grille2[case_id -t]
      grille1[case_id - t -1] <- grille2[case_id -t-1]
      return(grille1)
    }
    # coin haut droit
    if (case_id == t^2 -t+1){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id + 1] <- grille2[case_id +1]
      grille1[case_id - t +1] <- grille2[case_id -t+1]
      grille1[case_id - t] <- grille2[case_id -t]
      return(grille1)
    }
    
    # bord gauche
    if (1 < case_id & case_id < t){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id+1] <- grille2[case_id+1]
      grille1[case_id-1] <- grille2[case_id-1]
      grille1[case_id+t] <- grille2[case_id+t]
      grille1[case_id+t-1] <- grille2[case_id+t-1]
      grille1[case_id+t+1] <- grille2[case_id+t+1]
      return(grille1)
    }
    
    # bord droit
    if(t^2 -t+1 < case_id & case_id < t^2){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id+1] <- grille2[case_id+1]
      grille1[case_id-1] <- grille2[case_id-1]
      grille1[case_id-t] <- grille2[case_id-t]
      grille1[case_id-t-1] <- grille2[case_id-t-1]
      grille1[case_id-t+1] <- grille2[case_id-t+1]
      return(grille1)
    }
    
    # bord bas
    if(case_id %% t == 0 & case_id != t & case_id!= t^2){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id -t] <- grille2[case_id -t]
      grille1[case_id +t] <- grille2[case_id +t]
      grille1[case_id -t-1] <- grille2[case_id -t-1]
      grille1[case_id -1] <- grille2[case_id -1]
      grille1[case_id +t-1] <- grille2[case_id +t-1]
      return(grille1)
    } 
    
    # bord haut
    if (case_id%%t==1 & case_id!=1 & case_id!=t^2 -t+1){
      grille1[case_id] <- grille2[case_id]
      grille1[case_id -t] <- grille2[case_id -t]
      grille1[case_id +t] <- grille2[case_id +t]
      grille1[case_id -t+1] <- grille2[case_id -t+1]
      grille1[case_id +1] <- grille2[case_id +1]
      grille1[case_id +t+1] <- grille2[case_id +t+1]
      return(grille1)
    }
    
    # si la case n'est pas un coin ou un bord 
    else{
      grille1[case_id] <- grille2[case_id]
      grille1[case_id + 1] <- grille2[case_id +1]
      grille1[case_id - 1] <- grille2[case_id -1]
      grille1[case_id + t] <- grille2[case_id +t]
      grille1[case_id - t] <- grille2[case_id -t]
      grille1[case_id - t -1] <- grille2[case_id -t-1]
      grille1[case_id - t +1] <- grille2[case_id -t+1]
      grille1[case_id + t +1] <- grille2[case_id +t+1]
      grille1[case_id + t -1] <- grille2[case_id +t-1]
      return(grille1)  
    }
    

  }
  
  
}



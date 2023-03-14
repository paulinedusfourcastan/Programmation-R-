library(emoji)
library(emojifont)

# Fonction pour placer un drapeau 
place_drap <- function(drapeau, grille){
  grille[drapeau] <- emoji("triangular_flag_on_post")
  return(grille)
  
}


# Fonction pour enlever un drapeau 
deplace_drap <- function(drapeau, grille){
  grille[drapeau] <- paste0(emoji("sunflower"),drapeau)
  return(grille)
}
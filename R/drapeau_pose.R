library(emoji)
library(emojifont)

# Fonction pour placer ou enlever un drapeau 
# drapeau = numero de la case où on veut poser ou enlever un drapeau 

place_drap <- function(drapeau, grille){
  t <- nrow(grille)
  drap <- matrix(data =paste0(emoji("triangular_flag_on_post"),1:(t^2)), nrow = t, ncol = t)
  gg <- matrix(data =paste0(emoji("sunflower"),1:(t^2)), nrow = t, ncol = t)
  
  if (grille[drapeau]==drap[drapeau]){
    grille[drapeau] <- gg[drapeau]
    return(grille)
  }
  else{
    grille[drapeau] <- drap[drapeau]
    return(grille)}
  
}


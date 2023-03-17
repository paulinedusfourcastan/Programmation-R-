library(emoji)
library(emojifont)

# Fonction pour placer un drapeau 
place_drap <- function(drapeau, grille){
  t <- nrow(grille)
  drap <- matrix(data =paste0(emoji("triangular_flag_on_post"),1:(t^2)), nrow = t, ncol = t)
  grille[drapeau] <- drap[drapeau]
  return(grille)
  
}


# Fonction pour enlever un drapeau 
deplace_drap <- function(drapeau, grille){
  t <- nrow(grille)
  gg <- matrix(data =paste0(emoji("sunflower"),1:(t^2)), nrow = t, ncol = t)
  grille[drapeau] <- gg[drapeau]
  return(grille)
}
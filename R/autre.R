library(emoji)
library(emojifont)

compte_bombe <- function (grille){
  C <- sum(grille == -6)
  return(C)
}
  
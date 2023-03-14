library(emoji)
library(emojifont)
library(dplyr)

case_revel <- function(case_id, grille1, grille2){
  grille1[case_id] <- grille2[case_id]
  return(grille1)
  
}



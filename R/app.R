library(shiny)
library(shinyjs)
library(shinythemes)
library(emojifont)

ui <- fluidPage(
  theme = shinytheme("slate"),
  # header
  titlePanel('Jeu Du Démineur'),
  helpText("Niveau 1 : grille 15x15 et 50 bombes"),
  helpText("Niveau 2 : grille 15x15 et 70 bombes"),
  helpText("Niveau 3 : grille 15x15 et 100 bombes"),
  
  modalDialog(
    "Pour pouvoir commencer à jouer, il vous suffit de choisir le niveau
            de difficulté du démineur.",
    br(),
    "Le but du jeu est de creuser toutes les cases ne possédant pas de bombes",
    br(),
    "Bonne partie.",
    title = "Indications !",
    footer = modalButton("C'est parti"),
    size = "l",
    easyClose = FALSE,
    fade = TRUE,
  ),
  
  
  # sidebar
  sidebarLayout(
    
    sidebarPanel(
      
      radioButtons("bomb", label = h3("Choix du Niveau"),
                   choices = list("Niveau 1" = 50, "Niveau 2" = 70, "Niveau 3" = 100), 
                   selected = 1),
      
      actionButton("jeu_encore", "New Game"),
      
      selectInput("case_id", label=("Choix de la case à ouvrir"), choices =c(1:225)
      ),
      
      actionButton("clic", label="Clic"),
    ),
    
    #mainPanel
    mainPanel(
      
      tableOutput("grille_debut"),
      #tableOutput("grille_jeu")
    )
    
  )
  
)

source("grille_crea.R")
source("case_revelation.R")
source("jeu_tout_seul.R")

server <- function(input, output, session) {
  
  nb_bomb <- reactive({input$bomb})  # choix du niveau de difficulté donc du nb de bombes
  
  # Initialisation du jeu dès que l'on clique sur "New Game"
  grille_vide <- eventReactive(input$jeu_encore, {crea_vide(nb_bomb())})
  grille_remplie <- eventReactive(input$jeu_encore, {creation_grille(nb_bomb())})
  
  
  output$grille_debut <- renderTable({grille_vide()}, colnames = FALSE)

}

shinyApp(ui, server)
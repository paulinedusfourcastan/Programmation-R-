library(shiny)
library(shinyjs)
library(shinythemes)
library(emoji)
library(emojifont)

ui <- fluidPage(
  theme = shinytheme("slate"),
  # header
  titlePanel('Jeu Du Démineur'),
  helpText("Conseils :"),
  helpText("Ne commencez pas avec un nombre de bombes élevé."),
  helpText("Par exemple, entrainez-vous d'abord avec les paramètres définis."),
  
  modalDialog(
    "Pour pouvoir commencer à jouer, il vous suffit de choisir la taille du démineur ainsi que le nombre de bombes souhaité.",
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
  
  
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput('taille', "Taille de la grille NxN :", 10, min = 10, max = 15),
      
      numericInput("nb_bomb", "Nombre de mines :", 20, min = 20, max = 70),
      
      actionButton("go", "Nouvelle partie"),
      
      numericInput('case_id', "Choix de la case à ouvrir :", 1, min = 1, max = 225),
      
      actionButton("clic","Réveler"),
      
      numericInput('drapeau_id', "Choix de la case où poser/enlever le drapeau :", 1, min = 1, max = 225),
      
      actionButton("drap", "Poser/Enlever"),

      
    ),
    
    mainPanel(
      useShinyjs(),
      
      textOutput("global_counter", inline = TRUE),
      textOutput("NBomB"), 
      
      tableOutput("grille_2"),
    )
  )
)


server <- function(input, output, session) {
  
  # Timer 
  global_timer <- reactiveTimer(1000)
  global_counter_i <- 0L
  global_counter <- reactive({
    global_timer()
    on.exit(global_counter_i <<- global_counter_i + 1L)
    
    global_counter_i
  })
  
  output$global_counter <- renderText(global_counter())
  
  
  # Initialisation des paramètres 
  nbbomb <- reactive({input$nb_bomb})  # reactive du nombre de bombes choisie 
  
  Taille <- reactive({input$taille})   # reactive de la taille de la grille 
  
  values <- reactiveValues(nb_part=0, c = c())  # stockage des valeurs reactives relatives a l'ouverture d'une case
  
  values2 <- reactiveValues(nb_drap=0, c2 = c()) # stockage des valeurs reactives relatives a la pose d'un drapeau
  
  #Initialisation des grilles de jeu
  grille_debut <- eventReactive(input$go, {crea_vide(nbbomb(), Taille())})  # grille vide 
  
  grille_jeu <- eventReactive(input$go, {creation_grille(nbbomb(),Taille())})  # grille contenant les valeurs du démineur
  
  
  # Bombes
  NB <- eventReactive(input$go, {compte_bombe(grille_jeu())})
  output$NBomB <- renderText({paste("Il y a", NB(), "bombes dans la grille")})
  
  # Output 1
  # On affiche la grille vide
  output$grille_1 <- renderTable({grille_debut()}, colnames = FALSE)
  
  
  # observeEvent 1 
  observeEvent(input$clic, {
    values$c[values$nb_part] <- {input$case_id}
    values$nb_part <- values$nb_part + 1
    
  })
  
  # observeEvent
  observeEvent(input$drap, {
    values2$c2[values2$nb_drap] <- {input$drapeau_id}
    values2$nb_drap <- values2$nb_drap + 1
  })
  
  
  # Output 2 
  # le jeu commence
  output$grille_2 <- renderTable({
    G <- grille_debut()
    for (j in values2$c2){
      G <- place_drap(j, G)
    }
    
    for (i in values$c) {
      G <- case_revel(i, G, grille_jeu()) 
    }
    return(G)
    
    
  },colnames = FALSE)
  
  # observeEvent 
  observeEvent(input$go, {
    values$nb_part <- 0
    values$c <- c()
    values2$nb_drap <- 0
    values$c2 <- c()})
  
}

shinyApp(ui, server)

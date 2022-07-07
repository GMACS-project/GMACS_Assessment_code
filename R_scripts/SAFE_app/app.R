
# Set_Options <- function(Make_Comp, Ass_diff){
library(shiny)

if(!require(shinyWidgets)) install.packages("shinyWidgets")
library(shinyWidgets)

if(!require(shinyFiles)) install.packages("shinyFiles")
library(shinyFiles)



# setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("C:/Users/Matthieu Verson/Documents/GitHub/GMACS-project/GMACS_Assessment_code/R_scripts")



Spc.nam <-
  # list.files(paste0(dirname(dirname(getwd(
  # ))), "/Assessments/"))
  list.files(paste0(dirname(getwd(
  )), "/Assessments/"))
if (!is.null(Spc.nam %in% "AIGKC")) {
  Spc.nam <- c(Spc.nam[!Spc.nam %in% "AIGKC"], "EAG", "WAG")
}


# Define UI for application
ui <- shiny::fluidPage(
  
  # Application title
  titlePanel(h1("Create a SAFE document")),
  
  
  fluidRow(
    column(3,
           h4("Root directory"),
           shinyFiles::shinyDirButton(inputId = 'GMACS_dir',label = 'Root directory of the GMACS_Assessment_code folder',
                                      icon = shiny::icon("folder")),
           # Select the species
           shiny::selectInput(inputId = "Species", label = h4("Select a species"),choices = Spc.nam),
           
           shinyWidgets::materialSwitch(inputId = "Comp_Ver",label = 'Compare between GMACs version',value = FALSE,status = "primary"),
           
           
           shinyWidgets::materialSwitch(inputId = "Comp_Ass",label = 'Compare assessment model for a given version',value = FALSE,status = "primary")
    ),
    column(4, offset = 1,
           uiOutput(outputId = 'Comp_VerList')),
    column(4,
           uiOutput(outputId = 'Comp_AssList'))
  )
)


# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  # Specification of the system used ----
  # ************************************************************************** #
  osSystem <- Sys.info()["sysname"]
  if (osSystem == "Linux") {
    def_roots <- c(home = "~")
  } else {
    def_roots <- shinyFiles::getVolumes()()
  }
  
  # Give the Directory of the folder holding GMACS_Assessment_code folder ----
  # ************************************************************************** #
  shinyFiles::shinyDirChoose(input, 'GMACS_dir', roots = def_roots)  
  GMACS_dir_ready <- shiny::reactive({
    if(length(input$GMACS_dir) == 1) {
      path <- "not yet definded"
    } else {
      path <- file.path(
        shinyFiles::parseDirPath(def_roots, input$GMACS_dir)
      )
    }
    return(path)
  })
  output$GMACS_dir_ready <- renderUI({GMACS_dir_ready()})
  
  # COMPARISON BETWEEN VERSIONS ----
  # ************************************************************************** #
  
  output$Comp_VerList <- renderUI({
    
    con <- file(paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/GMACS_versions/Latest_Version/GMACS_version.txt"))
    out <- readLines(con, n = 1)
    close(con = con)
    
    if(input$Comp_Ver == TRUE){
      if(input$Species == "SNOW_crab"){
        .GMACSver <- dir(path = paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/GMACS_versions/GMACS_Terminal_molt/"),
                         pattern = "GMACS_V_")
      } else {
        .GMACSver <- dir(path = paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/GMACS_versions/GMACS_Orig/"),
                         pattern = "GMACS_V_")
      }
      .GMACSver <- c(.GMACSver, out)
    } else {.GMACSver <- out}
    
    column(4,
           # verbatimTextOutput('GMACSver1'),
           shiny::selectInput(inputId = "GMACSver",
                              label = h4(paste("Avalable version(s) for ", input$Species, sep="")),
                              choices = .GMACSver, multiple = TRUE, selectize = TRUE
           )
           # output$GMACSver1 <- renderPrint(input$GMACSver)
    )
    
    
  })
  # ************************************************************************** #
  
  
  
  # COMPARISON BETWEEN ASSESSMENTS ----
  # ************************************************************************** #
  # output$Comp_AssList <- renderUI({
  #   
  #   if(input$Comp_Ass == TRUE){
  #     if(input$Species == "EAG" || input$Species == "WAG"){
  #       .GMACsAss <- list.files(paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/Assessments/AIGKC/", input$Species))
  #     } else {
  #       .GMACsAss <- list.files(paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/Assessments/", input$Species))
  #     }
  #   } else {.GMACsAss <- c('None')}
  #   
  #   column(4,
  #          verbatimTextOutput('Assmod1'),
  #          shiny::selectInput(inputId = "Assmod", 
  #                             label = h4(paste("Avalable assessment model(s) for ", input$Species, sep="")),
  #                             choices = .GMACsAss, multiple = TRUE, selectize = TRUE
  #          ),
  #          output$Assmod1 <- renderPrint(input$Assmod)
  #   )
  #   
  #   
  #   
  # })
  
  # ************************************************************************** #
  
  
  
  
} # end server










# }


# Run the application
shinyApp(ui = ui, server = server)

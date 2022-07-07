
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
ui <- fluidPage(
  
  # Application title
  titlePanel(h1("Create a SAFE document")),
  
  # Set the directory that holds the GMACS_Assessment_code folder
  fluidRow(
    column(12,
           h4("Give the root directory holding the 'GMACS_Assessment_code' folder"),
           shinyFiles::shinyDirButton(
             id = "GMACS_dir",
             label = "Choose root directory",
             title = "Root directory of the GMACS_Assessment_code folder",
             icon = shiny::icon("folder")
           ),
           fluidRow(
             column(12, 
                    "",
                    uiOutput('GMACS_dir_ready')
             )
           )
    )
  ),
  hr(),
  
  # Select the species
  selectInput(
    "Species",
    label = h4("Select a species"),
    choices = Spc.nam
  ),
  hr(),
  
  # # Set the directory that holds the GMACS versions
  
  # fluidRow(
  #   column(12,
  #          h4("Give the root directory holding the 'GMACS_versions' folder"),
  #          shinyFiles::shinyDirButton(
  #            id = "GMACS_ver_dir",
  #            label = "GMACS version directory",
  #            title = "Directory for GMACS version(s)",
  #            icon = shiny::icon("folder")
  #          ),
  #          fluidRow(
  #            column(12, 
  #                   "",
  #                   uiOutput('GMACS_ver_dir_ready')
  #            )
  #          )
  #   )
  # ),
  # hr(),
  
  # Do you want to compare several versions of GMACS?
  fluidRow(
    column(12,
           h4("Compare between GMACs version"),
           materialSwitch(
             inputId = "Comp_Ver",
             label = '', 
             value = FALSE,
             status = "primary"
           ),
           fluidRow(
             column(12, 
                    "",
                    uiOutput('Comp_VerList')
             )
           )
    )
  ),
  
  
  hr(),
  
  
  # # Set the directory that holds assessments
  # fluidRow(
  #   column(12,
  #          h4("Give the root directory holding the 'Assessments' folder"),
  #          shinyFiles::shinyDirButton(
  #            id = "GMACS_Ass_dir",
  #            label = "Assessment directory",
  #            title = "Directory for assessment outputs",
  #            icon = shiny::icon("folder")
  #          ),
  #          fluidRow(
  #            column(12, 
  #                   "",
  #                   uiOutput('GMACS_Ass_dir_ready')
  #            )
  #          )
  #   )
  # ),
  # hr(),
  
  # Do you want to compare several models for a given version?
  fluidRow(
    column(12,
           h4("Compare between assessment model for a given version?"),
           materialSwitch(
             inputId = "Comp_Ass",
             label = '', 
             value = FALSE,
             status = "primary"
           ),
           fluidRow(
             column(12, 
                    "",
                    uiOutput('Comp_AssList')
             )
           )
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
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
  
  # # Give the Directory of the folder holding GMACS versions
  # shinyFiles::shinyDirChoose(input, 'GMACS_ver_dir', roots = def_roots)  
  # GMACS_ver_dir_ready <- shiny::reactive({
  #   if(length(input$GMACS_ver_dir) == 1) {
  #     path <- "not yet definded"
  #   } else {
  #     path <- file.path(
  #       shinyFiles::parseDirPath(def_roots, input$GMACS_ver_dir)
  #     )
  #   }
  #   return(path)
  # })
  # output$GMACS_ver_dir_ready <- renderUI({GMACS_ver_dir_ready()})
  
  # # Comparison between version
  # output$Comp_VerList <- renderUI({
  # 
  #   if(input$Comp_Ver == TRUE){
  #     if(input$Species == "SNOW_crab"){
  #       .GMACSver <- dir(path = paste0(GMACS_ver_dir_ready(), "/GMACS_versions/GMACS_Terminal_molt/"),
  #                                   pattern = "GMACS_V_")
  #     } else {
  #       .GMACSver <- dir(path = paste0(GMACS_ver_dir_ready(), "/GMACS_versions/GMACS_Orig/"),
  #                        pattern = "GMACS_V_")
  #     }
  #     con <- file(paste0(GMACS_ver_dir_ready(), "/GMACS_versions/Latest_Version/GMACS_version.txt"))
  #     out <- readLines(con, n = 1)
  #     close(con = con)
  #     .GMACSver <- c(.GMACSver, out)
  # 
  #     sidebarPanel(
  #       checkboxGroupInput(
  #         "GMACSver",
  #         label = h4(paste("Avalable version(s) for ", input$Species, sep="")),
  #         choices = .GMACSver
  # 
  #       )
  #     )
  #   }
  # 
  # })
  
  # Comparison between version
  output$Comp_VerList <- renderUI({
    
    if(input$Comp_Ver == TRUE){
      if(input$Species == "SNOW_crab"){
        .GMACSver <- dir(path = paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/GMACS_versions/GMACS_Terminal_molt/"),
                         pattern = "GMACS_V_")
      } else {
        .GMACSver <- dir(path = paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/GMACS_versions/GMACS_Orig/"),
                         pattern = "GMACS_V_")
      }
      con <- file(paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/GMACS_versions/Latest_Version/GMACS_version.txt"))
      out <- readLines(con, n = 1)
      close(con = con)
      .GMACSver <- c(.GMACSver, out)
      
      sidebarPanel(
        checkboxGroupInput(
          "GMACSver",
          label = h4(paste("Avalable version(s) for ", input$Species, sep="")),
          choices = .GMACSver
          
        )
      )
    }
    
  })  
  # ************************************************************************** #
  
  
  
  # COMPARISON BETWEEN ASSESSMENTS ----
  # ************************************************************************** #
  
  # # Give the Directory of the folder holding GMACS versions
  # shinyFiles::shinyDirChoose(input, 'GMACS_Ass_dir', roots = def_roots)  
  # GMACS_Ass_dir_ready <- shiny::reactive({
  #   if(length(input$GMACS_Ass_dir) == 1) {
  #     path <- "not yet definded"
  #   } else {
  #     path <- file.path(
  #       shinyFiles::parseDirPath(def_roots, input$GMACS_Ass_dir)
  #     )
  #   }
  #   return(path)
  # })
  # output$GMACS_Ass_dir_ready <- renderUI({GMACS_Ass_dir_ready()})
  # 
  # # Comparison between Assessment
  # output$Comp_AssList <- renderUI({
  #   
  #   if(input$Comp_Ass == TRUE){
  #     
  #     
  #     if(input$Species == "EAG" || input$Species == "WAG"){
  #       .GMACsAss <- list.files(paste0(GMACS_Ass_dir_ready(), "/Assessments/AIGKC/", input$Species))
  #     } else {
  #       .GMACsAss <- list.files(paste0(GMACS_Ass_dir_ready(), "/Assessments/", input$Species))
  #     }
  # 
  #     sidebarPanel(
  #       checkboxGroupInput(
  #         "GMACSver",
  #         label = h4(paste("Avalable assessment model(s) for ", input$Species, sep="")),
  #         choices = .GMACsAss
  #         
  #       )
  #     )
  #   }
  #   
  # })
  
  # Comparison between Assessment
  output$Comp_AssList <- renderUI({
    
    if(input$Comp_Ass == TRUE){
      if(input$Species == "EAG" || input$Species == "WAG"){
        .GMACsAss <- list.files(paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/Assessments/AIGKC/", input$Species))
      } else {
        .GMACsAss <- list.files(paste0(GMACS_dir_ready(), "/GMACS_Assessment_code/Assessments/", input$Species))
      }
      
      sidebarPanel(
        checkboxGroupInput(
          "GMACSver",
          label = h4(paste("Avalable assessment model(s) for ", input$Species, sep="")),
          choices = .GMACsAss
          
        )
      )
    }
    
  })
  
  # ************************************************************************** #
  
  
  
  
} # end server










# }


# Run the application
shinyApp(ui = ui, server = server)

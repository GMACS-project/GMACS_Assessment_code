library(shiny)

ui <- basicPage(
    shinyFiles::shinyDirButton(
        id = "test_dir_select",
        label = "Choose directory",
        title = "Directory selection",
        icon = shiny::icon("folder")
    ),
    shiny::htmlOutput("test_dir_select_ready")
)

server <- function(input, output) {
    
    osSystem <- Sys.info()["sysname"]
    if (osSystem == "Linux") {
        def_roots <- c(home = "~")
    } else {
        def_roots <- shinyFiles::getVolumes()()
    }
    
    shinyFiles::shinyDirChoose(input, 'test_dir_select', roots = def_roots)  
    
    test_dir_select_ready <- shiny::reactive({
        if(length(input$test_dir_select) == 1) {
            path <- "not yet definded"
        } else {
            path <- file.path(
                shinyFiles::parseDirPath(def_roots, input$test_dir_select)
            )
        }
        return(path)
    })
    
    output$test_dir_select_ready <- shiny::renderUI({
        shiny::HTML("<font color=\"red\">", test_dir_select_ready(), "</font>")
    })
    
}

shinyApp(ui, server)
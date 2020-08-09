#LOAD LIBRARIES
library(shiny)
library(DT)
library(shinyhelper)
library(plotly)
library(htmltools)


shinyUI(fluidPage(

    # Application title
    titlePanel("Data Analysis"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            #SELECT DATA SET
            h3("Data section"),
            selectInput(inputId = "data_set",label =  "Select a data set:", 
                        choices = c("iris","mtcars","USArrests"),selected = "iris") %>%  
                        helper(type = "inline",
                        title = "Description",
                        content = c("Please, choose a data set for the analysis."),
                        buttonLabel = "OK",
                        easyClose = FALSE,
                        fade = TRUE,
                        size = "m"),
            
            h3("Plot section"),
            #SELECT X VARIABLE
            htmlOutput("variable_x"),
            
            #SELECT INPUT - REGRESSORS
            htmlOutput("variables")
        ),

        mainPanel(

            tabsetPanel(type="pills",
                        tabPanel("Introduction",
                                 wellPanel(
                                           includeMarkdown("welcome.Rmd")
                                           )
                                 ),
                        tabPanel("Data section",
                                 wellPanel(DTOutput("data_selected"))),
                        tabPanel("Plot section",
                                 wellPanel(plotlyOutput("plot"))
                        )
            )

            
            
        )
    )
))

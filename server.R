#LOAD LIBRARIES
library(shiny)
library(DT)
library(shinyhelper)
library(plotly)


# Define server 
shinyServer(function(input, output) {
    
    #PARAMETER TO ALLOW HELP MESSAGE
    observe_helpers(withMathJax = TRUE)
    
    #DATA SET SELECTED
    output$result_data_Set <-  renderText({c(input$data_set)})
    
    #REACTIVE FUNCTION THAT IDENTIFY THE COLUMNS OF EACH DATA SET
    #ACCORDING WITH THE USER SELECTION
    sel_col <- reactive({
        if (input$data_set=="iris") {
            names(iris)
        }else if(input$data_set=="mtcars"){
            names(mtcars)
        }else if(input$data_set=="USArrests"){
            names(USArrests)
        }
    })
    
    #VARIABLE X
    output$variable_x <- renderUI({ 
        selectInput(inputId = "var_x",label =  "Select a X variable:", 
                    choices = sel_col()) %>%  helper(type = "inline",
                                                    title = "Description",
                                                    content = c("Please, choose the X variable of the plot."),
                                                    buttonLabel = "OK",
                                                    easyClose = FALSE,
                                                    fade = TRUE,
                                                    size = "m")
        
    })
    
    #VARIABLES
    output$variables <- renderUI({ 
        selectInput(inputId = "var_y",label =  "Select a Y variable:", 
                    choices = sel_col(),multiple = TRUE) %>%  helper(type = "inline",
                                                                title = "Description",
                                                                content = c("Please, choose the Y variable of the plot. You can choose one or several variables."),
                                                                buttonLabel = "OK",
                                                                easyClose = FALSE,
                                                                fade = TRUE,
                                                                size = "m")
        
    })

    #RESULT VARIABLES SELECTED
    output$result_var <-  renderText({c(input$columns)})
    
    #FUNCTION TO OBTAIN DATA
    dat <- reactive({
        if (input$data_set=="iris") {
            D <- iris
        }else if(input$data_set=="mtcars"){
            D <- mtcars
        }else if(input$data_set=="USArrests"){
            D <- USArrests
        }
        return(D)
    })
    
    #DATA FRAME
    output$data_selected <- renderDT({
        D1 <- dat()
   
        datatable(D1,rownames = FALSE,extensions = 'FixedColumns',
                  options = list(
                      scrollX = TRUE))
    })
    
    
    #PLOTY 
    x_axis <- list(
        title = "X variable selected",
        showticklabels = TRUE
    )
    
    y_axis <- list(
        title = "Y variables selected",
        showticklabels = TRUE
    )
    
    p_react <- reactive({
        D1 <- dat()
        
        a <- c(input$var_x,input$var_y)

        if (!is.null(input$var_y)) {
            p <- plot_ly(D1, x =  D1[,a[1]]) 
            
            for (i in 2:length(a)) {
                p <- add_lines(p,y = D1[,a[i]],name = a[i])
            }
            
            p %>%  layout(xaxis = x_axis, yaxis = y_axis)
                
                #layout(title = 'Plot selected')
            
        }else{
            NULL
        }
  
    })
    
    #PLOT
    output$plot <- renderPlotly({
        
        p_react()
        
    })
    
})

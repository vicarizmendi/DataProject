#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(ggplot2)

shinyServer(function(input, output) {
        
        output$newHist <- renderPlotly({
                if (input$def== TRUE)
                        plot_ly(z = volcano * input$phi , type = "surface")
                else
                        plot_ly(z = volcano * input$phi , type = "surface", colors =input$col)
        })
        output$Instr <- renderText( "Instructions")
        
}

)

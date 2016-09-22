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

z <- c(
        c(8.83,8.89,8.81,8.87,8.9,8.87),
        c(8.89,8.94,8.85,8.94,8.96,8.92),
        c(8.84,8.9,8.82,8.92,8.93,8.91),
        c(8.79,8.85,8.79,8.9,8.94,8.92),
        c(8.79,8.88,8.81,8.9,8.95,8.92),
        c(8.8,8.82,8.78,8.91,8.94,8.92),
        c(8.75,8.78,8.77,8.91,8.95,8.92),
        c(8.8,8.8,8.77,8.91,8.95,8.94),
        c(8.74,8.81,8.76,8.93,8.98,8.99),
        c(8.89,8.99,8.92,9.1,9.13,9.11),
        c(8.97,8.97,8.91,9.09,9.11,9.11),
        c(9.04,9.08,9.05,9.25,9.28,9.27),
        c(9,9.01,9,9.2,9.23,9.2),
        c(8.99,8.99,8.98,9.18,9.2,9.19),
        c(8.93,8.97,8.97,9.18,9.2,9.18)
)
dim(z) <- c(15,6)
z2 <- z + 1
z3 <- z - 1


shinyServer(function(input, output) {
        
        output$newHist <- renderPlotly({
        if (input$data == "volcano"){
                if (input$def== TRUE)
                        plot_ly(z = volcano * input$phi , type = "surface")
                else
                        plot_ly(z = volcano * input$phi , type = "surface", colors =input$col)}
        else if ( input$data == "zeta"){
                if (input$def== TRUE){
                        p <- plot_ly(z= z* input$phi, type="surface",showscale=FALSE) %>%
                        add_trace(z=z2* input$phi, type="surface", showscale=FALSE, opacity=0.98) %>%
                        add_trace(z=z3* input$phi, type="surface", showscale=FALSE, opacity=0.98)
                        p}
                else
                        {
                        p <- plot_ly(z= z* input$phi, type="surface",showscale=FALSE,colors =input$col) %>%
                                add_trace(z=z2 * input$phi, type="surface", showscale=FALSE, opacity=0.98,colors =input$col) %>%
                                add_trace(z=z3 * input$phi, type="surface", showscale=FALSE, opacity=0.98,colors =input$col)
                        p}                        
                }
                
        }) 
        
}) 

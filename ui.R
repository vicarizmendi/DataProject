#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        headerPanel("	Topographic Information on Auckland's Maunga Whau Volcano"),
        sidebarLayout(
                sidebarPanel(
                        selectInput("output", 
                                    "Do you need instructions?", 
                                    choices = c(Yes="Yes", No="No")),
                        helpText("To go to the plot just select the option  -No- above"),
                        helpText("To go to the instructions just select the option  -Yes- above"),
                        
                        conditionalPanel(condition = "input.output=='No'", 
                                         sliderInput('phi', 'Scale the height',value = 1, 
                                                     min = 0.22, max = 2.37, step = 0.005),
                                         checkboxInput("def", "Default colors",
                                                       value = FALSE),              
                                         selectInput("col", "Other colors:",
                                                     choices = c("YlOrRd", "Blues","snow1",
                                                                 "lavenderblush1",
                                                                 "yellowgreen","mediumvioletred",
                                                                 "firebrick4")))
                        
                ), 
                
                mainPanel(
                        
                        conditionalPanel(
                                condition = "input.output=='Yes'",
                                h2(textOutput("Instr")),
                                h3("This APP has been created using RStudio Shiny package, by ADVATICA (vicarizmendi), for the Coursera  `Developing Data Products Course Project`"),
                                h3("- The plot shows how Shiny works fine with Plotly, a collaboration platform for modern data science"),
                                h3("- It represents the Maunga Whau Volvano in a 3D representation"),
                                h3("- The dataset - volcano- is available in the `datasets` R package"),                                        
                                h3("- The App can be easily changed to plot, for instance, predictive models with 2 predictors"),
                                h3("- You can select different Plotly dynamic options on the top right icons: zooming,changing the perspective (turntable rotation, orbital rotation), dowloading the plot in png format, and others "),
                                h3("- To see the icons and move the plot, the mouse has to be on the plot itself"),
                                h3("- By changing the controls on the left sidebar panel you can change colors and height of the 3D plot"),
                                h3("- To go to the plot just select the option  No on the left panel")
                                
                        ),
                        conditionalPanel(
                                condition = "input.output=='No'", 
                                plotlyOutput('newHist')))
        )
)) 


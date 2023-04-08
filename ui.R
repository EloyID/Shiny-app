#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data(mtcars)
# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Plotting mtcars data"),
    
    h1('Documentation - how to use it'),
    p('Using this app is very easy. We plot the data from the mtcars dataset with a regression line and print the corresponding formula.'),
    p('Choose the predictor'),
    p('Choose the outcome '),
    p('The app will plot them and show a linear regression line'),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            radioButtons( "predictor",
                          "Predictor",
                          names(mtcars)
              
            ),
            radioButtons( "outcome",
                          "Outcome",
                          names(mtcars)
            ),

        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            verbatimTextOutput("regression")
        )
    )
)

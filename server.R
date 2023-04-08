#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(mtcars)

# Define server logic required to draw a histogram
function(input, output, session) {
      
    output$distPlot <- renderPlot({
        qplot(x=mtcars[,input$predictor], y=mtcars[,input$outcome],
             xlab = input$predictor,
             ylab = input$outcome,
             main = 'Correlation between variables',
             geom= c("point")) + 
        geom_smooth(method="lm")
    })
    
    output$regression = reactive({
      if(input$outcome == input$predictor) {return("y = x")}
      fit = lm(as.formula(paste(input$outcome,"~",input$predictor)), data=mtcars)
      paste("y = ", round(fit$coefficients[[1]],2), " + ",round(fit$coefficients[[2]],2),"x")
    })

}

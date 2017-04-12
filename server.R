library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)

grammar <- read.csv(file = "comma-survey-data.csv", stringsAsFactors = FALSE)



shinyServer(function(input, output) {
  
  output$view <- renderTable({
    grammar
    
  
  })
  
  output$viewPlot <- renderPlot({
    ggplot(data = grammar) +
      geom_bar(mapping = aes(x = How.would.you.write.the.following.sentence.))
  }) 
  
  
})

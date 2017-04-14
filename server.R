library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)

grammar <- read.csv(file = "clean-grammar.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
edit.grammar <-na.omit(grammar)



shinyServer(function(input, output) {
  selectedData <- reactive({
    
  })
  
  output$text1 <- renderText({
    paste("Hello", selectedData())
  })
  
  output$viewPlot <- renderPlot({
    ggplot(data = grammar) +
      geom_bar(mapping = aes_string(x = input$selectSentence))
    
  }) 
  

  
  
})

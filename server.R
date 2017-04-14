library(shiny)
library(plotly)
library(dplyr)
library(tidyr)
library(ggplot2)
library(lazyeval)

grammar <- read.csv(file = "clean-grammar.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
edit.grammar <- na.omit(grammar)


shinyServer(function(input, output) {
  selected.data <- reactive({
    filter.data <- edit.grammar %>% 
      filter(age == input$radioAge) %>% 
      filter(education == input$radioEducation) %>% 
      select_(input$selectSentence, "gender") %>% 
      group_by_(input$selectSentence, "gender") %>%
      summarise( total = n())
    
    long.data <- spread(filter.data, gender, total) 
    return(long.data)
  })
  
  
  output$table <- renderTable({
    out.data <- selected.data()
    return(out.data)
  })
 
  
  output$viewPlot <- renderPlotly({
      # x parameter not rendering correctly
      plot_ly(selected.data(), x = ~aes_(input$selectSentence), y=~Female, type = "bar", name = "Female") %>% 
      add_trace(y = ~Male, name = "Male") %>% 
      layout(yaxis = list(title = "Count"), barmode = 'group', xaxis = list(title = input$selectSentence))
    
  }) 
  
})

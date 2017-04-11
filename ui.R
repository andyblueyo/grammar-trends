library(shiny)
grammar <- read.csv(file = "comma-survey-data.csv", stringsAsFactors = FALSE)

shinyUI(fluidPage(
  
  titlePanel("Grammar"),
  
  mainPanel(
    tableOutput("view")
  )
  
  
))
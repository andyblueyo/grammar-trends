library(shiny)
library(plotly)

grammar <- read.csv(file = "comma-survey-data.csv", stringsAsFactors = FALSE)

shinyUI(fluidPage(
  
  titlePanel("Grammar Trends"),
  p("This shiny application is built to answer questions about grammar usage in terms of demographic and
      prefernces of grammar practices such as the oxford comma. This dataset is from fivethirtyeight."),
  
  sidebarLayout(
    sidebarPanel(
    checkboxGroupInput("checkage", label = h3("checkbox"), choices = unique(grammar$Age), selected = "30-44")),
    mainPanel(
      titlePanel("Title"),
      plotOutput("viewPlot")
    )
  ),
  
  mainPanel(
    headerPanel("Table of Grammar"),
    plotOutput("viewPlot")
  ),
  mainPanel(

  )
  
 
  
  
))
library(shiny)
library(plotly)

grammar <- read.csv(file = "comma-survey-data.csv", stringsAsFactors = FALSE)

age.factors <- unique(grammar$Age)
age.title <- c("30-44", "18-29", "NA", "Older than 60", "45-60")
names(age.factors) <- age.title



shinyUI(fluidPage(
  
  titlePanel("Grammar Trends"),
  p("This shiny application is built to answer questions about grammar usage in terms of demographic and
      prefernces of grammar practices such as the oxford comma. This dataset is from fivethirtyeight."),
  
  sidebarLayout(
    sidebarPanel(
    selectInput("selectSentence", label = h3("Grammar Type"), choices = names(grammar)),
    checkboxGroupInput("checkGender", label = h3("Gender"), choices = unique(grammar$Gender), selected = "Male"), 
    radioButtons("radioAge", label = h3("Age"), choices = age.factors, selected = age.factors[2])),
    mainPanel(
      h1("Title"),
      plotOutput("viewPlot")
    )
  )
  
 
  
  
))
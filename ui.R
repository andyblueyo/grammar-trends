library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Grammar Trends"),
  p("This shiny application is built to answer questions about grammar usage in terms of demographic and
      prefernces of grammar practices such as the oxford comma. This dataset is from fivethirtyeight."),
  
  sidebarLayout(
    sidebarPanel(
    selectInput("selectSentence", label = h3("Grammar Type"), choices = list("Oxford Comma Sentence" = 'o.c.sentence',
                                                                          "Oxford Comma Preference" = 'o.c.feeling',
                                                                          "Noun Plurality Sentence" = 'n.p.sentence',
                                                                          "Noun Plurality Preference" = 'n.p.feeling',
                                                                          "Grammar Preference" = 'g.feeling')),
    checkboxGroupInput("checkGender", label = h3("Gender"), choices = c("Male" = 'Male', "Female" = 'Female'), selected = "Male"), 
    radioButtons("radioAge", label = h3("Age"), choices = c("18-29" = "18-29", "30-44" = "30-44", "45-60" = "45-60", "Older than 60" = "> 60"), selected = "18-29")),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", 
                 h3("Title"),plotOutput("viewPlot"),
                 textOutput("text1")),
        tabPanel("Table", tableOutput("table"))
      
      )
    )
  )
  
))
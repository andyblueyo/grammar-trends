library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  titlePanel("Grammar Trends"),
  p("This shiny application is built to answer questions about grammar usage in terms of demographic and
      prefernces of grammar practices such as the oxford comma. This dataset is from fivethirtyeight."),
  tags$li("The Oxford Comma and the Noun Plurality sentence asks participants which sentence they believed to be more gramatically correct."),
  tags$li("The Oxford Prefernce asks participants how much they cared about the use of the oxford comma."),
  tags$li("The Noun Plurality Preference asks participants how much they care about the proper usage of singular and plural verbs."),
  tags$li("The Grammar Preference asks participants how important they belive the use of proper grammar is."),
  p(" "),
  
  sidebarLayout(
    sidebarPanel(
    selectInput("selectSentence", label = h3("Grammar Type"), choices = list("Oxford Comma Sentence" = 'o.c.sentence',
                                                                          "Oxford Comma Preference" = 'o.c.feeling',
                                                                          "Noun Plurality Sentence" = 'n.p.sentence',
                                                                          "Noun Plurality Preference" = 'n.p.feeling',
                                                                          "Grammar Preference" = 'g.feeling')),
    radioButtons("radioEducation", label = h3("Education"), choices = c("Less than high school" = 'Less than high school degree', 
                                                                        "High School Degree" = 'High school degree',
                                                                        "Some College or Associate Degree" = 'Some college or Associate degree',
                                                                        "Bachelor Degree" = 'Bachelor degree',
                                                                        "Graduate Degree" = 'Graduate degree'), selected = "Less than high school degree"), 
    radioButtons("radioAge", label = h3("Age"), choices = c("18-29" = "18-29", "30-44" = "30-44", "45-60" = "45-60", "Older than 60" = "> 60"), selected = "18-29")),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", 
                 plotlyOutput("viewPlot")),
        tabPanel("Table", tableOutput("table"))
      
      )
    )
  )
  
))
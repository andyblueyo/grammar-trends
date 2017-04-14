library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Grammar Trends"),
  p("This shiny application is built to answer questions about grammar usage in terms of demographic and
      prefernces of grammar practices such as the oxford comma. This dataset is from fivethirtyeight."),
  
  sidebarLayout(
    sidebarPanel(
    selectInput("selectSentence", label = h3("Grammar Type"), choices = c("Oxford Comma Sentence" = "In.your.opinion..which.sentence.is.more.gramatically.correct.",
                                                                          "Oxford Comma Preference" = "How.much..if.at.all..do.you.care.about.the.use..or.lack.thereof..of.the.serial..or.Oxford..comma.in.grammar.",
                                                                          "Noun Plurality Sentence" = "How.would.you.write.the.following.sentence.",
                                                                          "Noun Plurality Preference" = "How.much..if.at.all..do.you.care.about.the.debate.over.the.use.of.the.word..data..as.a.singluar.or.plural.noun.",
                                                                          "Grammar Preference" = "In.your.opinion..how.important.or.unimportant.is.proper.use.of.grammar.")),
    checkboxGroupInput("checkGender", label = h3("Gender"), choices = c("Male" = "Male", "Female" = "Female"), selected = "Male"), 
    radioButtons("radioAge", label = h3("Age"), choices = c("18-29" = "18-29", "30-44" = "30-44", "45-60" = "45-60", "Older than 60" = "> 60"), selected = "18-29")),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", 
                 h3("Title"),plotOutput("viewPlot")),
        tabPanel("Table", tableOutput("table"))
      
      )
    )
  )
  
))
library(shiny)
grammar <- read.csv(file = "comma-survey-data.csv", stringsAsFactors = FALSE)
print(colnames(grammar))
colnames(grammar) <- c("Respondent ID", "In your opinion which sentence is more gramatically correct?", 
                       "Prior to reading about it above, had you heard of the serial or Oxford comma?", 
                       "How much if at all do you care about the use or lack thereof of the serial or Oxford comma in grammar?",
                       "How would you write the following sentence?", 
                       "When faced with using the word data have you ever spent time considering if the word was a singular or plural noun?",
                       "How much if at all do you care about the debate over the use of the word data as a singluar or plural noun?",
                       "In your opinion how important or unimportant is proper use of grammar?",
                       "Gender", "Age", "Household Income", "Education", "Location Census Region")

shinyServer(function(input, output) {
  
  output$view <- renderTable({
    grammar
  })
  
})
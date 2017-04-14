library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)

grammar <- read.csv(file = "comma-survey-data.csv", stringsAsFactors = FALSE)

grammar$Gender[grammar$Gender == ""] <- NA
unique(grammar$Gender)
head(grammar$Gender)



no <- ggplot(data = grammar) +
  geom_bar(mapping = aes(x = How.would.you.write.the.following.sentence.))
no

pie <- no + coord_polar("x", start=100)
pie

grammar.table <- filtered()




p <- plot_ly(grammar, labels = grammar$How.would.you.write.the.following.sentence., values = type = 'pie') %>%
  layout(title = 'United States Personal Expenditures by Categories in 1960',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p






colnames(grammar) <- c("Respondent ID", "In your opinion which sentence is more gramatically correct?", 
                       "Prior to reading about it above, had you heard of the serial or Oxford comma?", 
                       "How much if at all do you care about the use or lack thereof of the serial or Oxford comma in grammar?",
                       "How would you write the following sentence?", 
                       "When faced with using the word data have you ever spent time considering if the word was a singular or plural noun?",
                       "How much if at all do you care about the debate over the use of the word data as a singluar or plural noun?",
                       "In your opinion how important or unimportant is proper use of grammar?",
                       "Gender", "Age", "Household Income", "Education", "Location Census Region")
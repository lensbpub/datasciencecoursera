
library(shiny)
# nGramAll <- fread('predictionTableFull.csv')

shinyUI(fluidPage(
    titlePanel("Next Word Prediction App"),
    sidebarLayout(
        sidebarPanel(
            strong("Introduction"),
            p("This is the Shiny App for the next word prediction"),
            p("The used algorithm is based on Katz's backk-off model with two different N-grams,
              a 2-gram y a 7-gram"),
            strong("Instructions"),
            p("The inputs are the following"),
            tags$ul(
                tags$li("Query word/phrase: word or phrase for prediction"),
                tags$li("Number of predicted next word: the number of predictions")
            ),
            strong("Output"),
            p("THe predicted next word will be shown in the order of the most frequent to the least frequent")
        ),
        mainPanel(
            h4("Query word/phrase: "),
            tags$textarea(id="query", rows=2, cols=50),
            HTML("<br>"),
            HTML("<br>"),
            h4("Number of predictions:"),
            sliderInput("wordN", "", min=1, max=5, value=1, step=1),
            HTML("<br>"),
            hr(),
            HTML("<br>"),
            h4("Predicted next word"),
            verbatimTextOutput("predicted")
        )
    ),
))

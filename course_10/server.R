
library(shiny)
library(data.table)

shinyServer(function(input,output){
    source('nextWordsApp.R')
    nGramAll <- fread('predictionTableFull.csv')

    # Predict next next words
    observe({
        query <- as.character(input$query)
        n <- input$wordN
        result <- nextWords(query, n, nGramAll)
        if(query==''){
            output$predicted <- renderPrint(cat(''))
        }else{
            output$predicted <- renderPrint(cat(result,sep='\n'))
        }
    })
})


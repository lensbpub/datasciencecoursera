
library(shiny)
library(ggplot2)
data(swiss)


shinyServer(function(input, output){
    # === Histogram ===
    histVal <- reactive({
        swiss[, input$histX]
    })

    output$HistOneVar <- renderPlot({
        hist(swiss[, input$histX], breaks=seq(min(histVal()), max(histVal()), length.out=input$bins+1),
        xlab=input$histX, main=paste('Distribution of', input$histX), col="darkgray", border="white")
    })

    # === Scatter Plot ###
    scatX <- reactive({swiss[,input$scatterX]})
    scatY <- reactive({swiss[, input$scatterY]})
    scatCol <- reactive({swiss[, input$scatterCol]})

    output$ScatThreeVar <- renderPlot({
        ggplot(data=swiss,aes(x=scatX(), y=scatY(), color=scatCol())) + geom_point +
            xlab(input$scatterX) + ylab(input$scatterY) + labs(colour=input$scatterCol) +
            ggtile(paste('Scatter plot of', input$scatterX, 'vs', input$scatterY)) +
            theme(plot.title=element_text(hjust=0.5))
    })
})


library(shiny)
data(swiss)

shinyUI(fluidPage(
    # Title
    titlePanel("Swiss Fertility and Socioeconomic Indicators - Data Exploration"),
    # Sidebar
    sidebarLayout(
        strong("Histogram parameters"),
        p(''),
        sliderInput("bin","Bins for histogram:", min=1,max=30, value=15),
        selectInput("hitX","Select variable for histogram", names(swiss),selected="Fertility"),
        p(''),p(''),p(''),
        strong("Scatter plot parameters"),
        p(""),
        selectInput("scatterX","Select x axis for the scatter plot", names(swiss),selected="Fertility"),
        selectInput("scatterY", "Select y axis for the scatter plot", names(swiss),selected="Fertility"),
        selectInput("scatterCol", "Select color for the scatter plot",names(swiss),selected="Fertility"),

        # Section to describe the variables
        strong("Variable Description"),
        tags$ul(
            tags$li("Fertility: common standardized fertility measure"),
            tags$li("Agriculture: $ of males involved in agriculture as occupation"),
            tags$li("Examination: % draftees receiving highest mark on army examination"),
            tags$li("Education: %education beyond primary school for draftees"),
            tags$li("Catholic: %catholid (as opposed to protestant)"),
            tags$Li("Inf. Mort. %")
        )
    ),
    mainPanel(
        p("This App explores the swiss data, a standardized fertility measure and socio-economic indicators
        for each of the 47 French-speaking provinces of Switzerland at about 1888."),
        p(""),
        p("This App allows the exploration of:"),
        p("(1). Select one vaariable and the bin size to display the distribution is a histogram"),
        p("(2). Select three variables to display the correlation in a scatter plot"),
        plotOutput("HistOneVar"),
        plotOutput("ScatThreeVar")
    )
)
))
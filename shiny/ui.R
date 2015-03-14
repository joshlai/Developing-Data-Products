library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Singapore Population Census"),
  
  # Sidebar with a slider input for years (1960 - 2014)
  sidebarLayout(
    sidebarPanel(
      h4("Welcome!"), 
      div("The charts on right show the Singapore population and races distributed for over past 54 years. Please toggle the sliders below, as the results of the charts change accordingly."),
      br(),
      div("The statements below the siders also tell you more about the Year that you have selected."),
      br(),
      
      sliderInput("aYear",
                  "Select a Year for more details",
                  min = 1960,
                  max = 2014,
                  value = 1960),
      
      sliderInput("years",
                  "Choose Range (Years)",
                  min = 1960,
                  max = 2014,
                  value = c(1960,2014)),      
      
      br(),
      h4(textOutput("text1")),
      br(),
      h4(textOutput("text2"))
      ),
    
    # Show plot of the population distribution
    mainPanel(
      plotOutput("plot1",width = "100%", height = "400px"),
      
      plotOutput("plot2",width = "100%", height = "400px")
      
    )
      
  )
))

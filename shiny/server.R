library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  pop <- read.csv(file="population-race.csv", header=TRUE)
  
  output$text1 <- renderText({
    paste("You have selected Year ", input$aYear,"!")
  })
  
  output$text2 <- renderText({
    malay <- pop[(pop$Year == input$aYear & pop$Race =='Malay'),]$Population
    chinese <- pop[(pop$Year == input$aYear & pop$Race =='Chinese'),]$Population
    indian <- pop[(pop$Year == input$aYear & pop$Race =='Indian'),]$Population
    others <- pop[(pop$Year == input$aYear & pop$Race =='Others'),]$Population
    paste("There were ", malay, " Malays, ", chinese, " Chineses, ", indian, " Indians and ", others, " other ethnic races.")
  })
  
  output$plot1 <- renderPlot({
     #draw the graph with specifc years
     yearMin <- input$years[1]
     yearMax <- input$years[2]
     aYear <- input$aYear
     g <- qplot(x=pop[(pop$Year >=yearMin & pop$Year <= yearMax),'Year'], y=pop[(pop$Year >=yearMin & pop$Year <= yearMax),'Population']/1000, data=pop[(pop$Year >=yearMin & pop$Year <= yearMax),],  
           color=Race, alpha=I(.5), main=paste("Singapore Population Census (",yearMin,"-",yearMax, ")"), xlab="Year", ylab="Population in 1000s")
     g  + geom_vline(xintercept = aYear, color= 'grey', size=1)
  })
  
  output$plot2 <- renderPlot({
    aYear <- input$aYear
    ggplot(pop[pop$Year==aYear,], aes(x = "", y = Population/1000, fill = Race)) +
      geom_bar(width = 1, stat = "identity") +
      coord_polar("y", start = pi/3) +
      labs(title = paste ("Population Distribution in ", aYear))
  })
  
})


      
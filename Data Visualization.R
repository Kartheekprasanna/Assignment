ui   <- fluidPage(
  selectInput("region", "Sex:", 
              choices=c("Male","Female")),
  plotOutput("phonePlot"),
  selectInput("region1","ChestPaintype:",choices = c("0","1","2","3")),
  plotOutput("phonePlot1"),
  selectInput("region2", "Sex:", 
              choices=c("Male","Female")),
  plotOutput("phonePlot2")
)

server <- function(input, output) {
  output$phonePlot <- renderPlot({
    newdata <- heart[ which(heart$Sex==input$region), ]
    ggplot(newdata, aes(newdata$Cholestrol)) + 
      geom_histogram(aes(y=..density..), colour="black", fill="light blue", binwidth=10) +
      geom_density(alpha=.2, fill="#FF6666") 
  })
  
  
  output$phonePlot1 <- renderPlot({
    data<-heart[which(heart$ChestPainType==input$region1),]
    barplot(mean(data$MaxHeartRateAchieved),  density = 25, col = "red",
            main = mean(data$MaxHeartRateAchieved), xlab = "Chest")
    
  })
  
  output$phonePlot2 <- renderPlot({
    newdata <- heart[ which(heart$Sex==input$region2), ]
    ggplot(newdata, aes(newdata$OldPeak)) + 
      geom_histogram(aes(y=..density..), colour="black", fill="white", breaks=10, intervals=10) +
      geom_density(alpha=.5, fill="cyan") 
  })
}

shinyApp(ui, server)

# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.

library(shiny)
library(e1071)

data(Titanic)
df <- as.data.frame(Titanic)
mod <- naiveBayes(Survived ~ ., data = Titanic)

shinyUI( pageWithSidebar(
  headerPanel( "Naive Bayes Classifier applied to Titanic dataset"),
  sidebarPanel(
    img(src="titanic.jpg"),
    h4("Titanic passenger's attributes:"),
    br(),
    selectInput( "cl", "Class", levels(df[1,1]), "Crew"),
    selectInput( "se", "Sex", levels(df[1,2]), "Male"),
    selectInput( "ag", "Age", levels(df[1,3]), "Adult"),
    br(),
    h4("Naive Bayes associated prediction:"),
    br(),
    h5("Survived ?"),
    textOutput("result")
  ),
  mainPanel(
    h3("Titanic data set"),
    p("The Titanic data set provides information on the fate of 2.201 passengers on the fatal maiden voyage of the ocean liner, summarized according to economic status (class), sex, age and survival."),
    h3("Naive Bayes prediction"),
    p("Based on this data set this ShinyApp uses a Naive Bayes classifier prediction model and display the associated stats numbers based on passenger's attributes"),
    plotOutput('plot1')
  )
))
shinyServer  
  function(input, output, session) 
  
  output$plot1 <- renderPlot({
    
    selectedData <- df[df$Class==input$cl & df$Sex==input$se & df$Age==input$ag,5]
    bplt <- barplot(selectedData,
                    beside=TRUE, horiz=TRUE, xlim=c(0,700),
                    main="Titanic stats based on selected passengers's attributes",
                    ylab="Total",
                    col=c("black", "grey"),
                    legend = c("Deads", "Survivors")
    )
    text(x=selectedData+20,
         y=bplt,
         labels=as.character(selectedData),
         xpd=TRUE)
  })
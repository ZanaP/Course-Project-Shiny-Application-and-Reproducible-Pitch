library(shiny)
data(USArrests)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("Murder rates per diverse states in USA"),
  sliderInput(inputId = "num", label = "Choose a number",
              value = 150, min = 20,max = 530),
  plotOutput("hist")
)

server <- function(input, output) {
  
  output$hist <- renderPlot({
    data("USArrests")
    x <- USArrests$Murder
    hist(rnorm(input$num))
    hist(col = 'darkgray', border = 'white')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
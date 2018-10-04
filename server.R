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

library(shiny)
data(USArrests)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("Murder rates per diverse states in USA"),
  sliderInput(inputId = "num", label = "Choose a number",
              value = 150, min = 20,max = 530),
  plotOutput("hist")
)

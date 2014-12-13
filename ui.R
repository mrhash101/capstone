## Data Science Capstone project app
## Hassan Khalid
## Date: 13th dec 2014

## User Interface file

library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Coursera Data Science Capstone Project"),
  
  
  sidebarPanel(
    
    
    #Input data to be processed - text
    textInput(inputId = 'query', label = "Please type here", value = ""),
    tags$hr(),
    
    br(),
    br(),
    br(),
    #Parameters/Variables
    
      
    actionButton ("runlocal", "Submit")
  ),
  
  mainPanel(
    #output structure
    textOutput('compute'),
    
    br(),
    print("2-grams"),
    textOutput('ans1'),
    br(),
    br(),
    print("3-grams"),
    textOutput('ans2'),
    br(),
    br()
    
  )
  
))

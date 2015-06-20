library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Titanic Survival Prediction"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
      helpText("This app calculates the probability of survival from the Titanic based on the following criteria"),            
      br(), 
      radioButtons("AC", "Accomodation Class:",
                   c("Class 1" = "1",
                     "Class 2" = "2",
                     "Class 3" = "3")),
      br(),
      
      radioButtons("Sex", "Sex:",
                   c("M" = "1",
                     "F" = "0")),
      br(),
      
      numericInput('Age', 'Age:', 30, min = 0.42, max = 80, step = 5),
      br(),
      
      sliderInput("SibSp", 
                  "Sibilings or Spouse:", 
                  value = 4,
                  min = 0, 
                  max = 8)
      
      
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs",  
                  tabPanel("Result", 
                           h3("With the input you made, the probability of survival is:"),
                           verbatimTextOutput("inputvalue"),
                           h3("If the probability is 0.5 or greater, the passenger survived!")), 
                  tabPanel("Info", p("This application predicts if a person survived or not to the titanic. For it to run, the app takes 4 inputs: Accomodation Class, Sex, Age and Number of sibilings."),
                           br(),
                           p("The prediction is based on a simple linear regression model with binary output. The model was stablish as follows:"),
                           br(),
                           code('lm(Survived ~ AccomodationClass + Sex + Age + SibSp, data = titanic)'),
                           br(),
                           br(),
                           p("With the results from the model the prediction is made.")
                           
                           )
      )
    )
  )
))

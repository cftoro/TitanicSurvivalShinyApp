
shinyServer(
  function(input, output) {
    
    output$inputvalue <- renderPrint({as.numeric(input$AC)*-0.184446 + as.numeric(input$Sex)*-0.509682 + 1.334594 - as.numeric(input$Age)*0.005829 - as.numeric(input$SibSp)*0.045349 })
    
  }
)
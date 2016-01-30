library(e1071)
library(caret); library(kernlab)
library(randomForest)

#Loading predixtion model data
load('data/predModels.RData', verbose = TRUE)

shinyServer(function(input, output) {
  whichModel <- reactive({
    switch(input$predModel, 
           "tree" = "Tree",
           "rf" = "Random Forest",
           "rf10PCA" = "Random Forest with 10 PCAs",
           "boost" = "Boosting")
  })
  whichSensitivity <- reactive({
    switch(input$predModel, 
           "tree" = accTR,
           "rf" = accRF,
           "rf10PCA" = accPCA,
           "boost" = accBoost)
  })
  whichTable <- reactive({
    switch(input$predModel,
           "tree" = tableTR,
           "rf" = tableRF,
           "rf10PCA" = tablePCA,
           "boost" = tableBoost)
  })
  
  whichSummary <- reactive({
    switch(input$predModel, 
           "tree" = modFitTR$finalModel,
           "rf" = modFitRF,
           "rf10PCA" = modFitPCA,
           "boost" = modFitBoost)
  })
  
  whichAccuracy <- reactive({
    switch(input$predModel, 
           "tree" = resampleTR,
           "rf" = resampleRF,
           "rf10PCA" = resamplePCA,
           "boost" = resampleBoost)
  })
  
  output$text <- renderText({ 
    paste(whichModel(), " prediction model details")
  })
  
  output$sensitivity <- renderPrint({
    whichSensitivity()
  })
  
  output$summary <- renderPrint({
    whichSummary()
  })
  
  output$accuracy <- renderPrint({
    whichAccuracy()
  })
  
  output$outputTable <- renderTable({
    whichTable()
  })
})
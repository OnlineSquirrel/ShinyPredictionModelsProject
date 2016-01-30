library(shiny)

shinyUI(fluidPage(
  titlePanel("Weight Lifting Prediction Model Comparison"),
  fluidRow(
    column(6,
           wellPanel(
             radioButtons("predModel", label = strong("Please select the Prediction Model:"),
                          choices = list("Tree" = "tree", "Random Forest" = "rf", "Random Forest with 10 PCAs" = "rf10PCA", "Boosting"="boost"),
                          selected = "tree"),
             br(),
             br(),
             br(),
             br(),
             strong("Documentation"),
             br(),
             "This application shows performance of several prediction models on a weight lifting experiment data.",
             br(),
             "With the increased use of devices like Jawbone Up, Nike FuelBand, and Fitbit it became easy and inexpensive to collect a large amount of data about personal activity.",
             br(),
             p("One of those collections has been made publicly available on http://groupware.les.inf.puc-rio.br/har"),
             "It contains data collected from several users while performing various weight lifting activities. For each of the records, information whether the activity was executed correctly or not, was added.",
             br(),
             "In one of the previous Coursera courses, we were tasked with developing a model that would most accurately predict that variable.We used the *train* data set(subset of the whole experiment set) to develop several models.",
             br(),
             "This application does not calculate and develop these models since the calculation time would maybe be in hours.",
             br(),
             "Instead, we recorded/saved different objects related to those models for use in this aplication.",
             br(),
             "Code for the application can be found at",
             a("https://github.com/OnlineSquirrel/ShinyPredictionModelsProject"),
             br(),
             br(),
             br(),
             strong("References"),
             br(),
             "The data for this project was obtained from http://groupware.les.inf.puc-rio.br/har",   
             br(),
             "Velloso, E.; Bulling, A.; Gellersen, H.; Ugulino, W.; Fuks, H.",
             br(),
             "Qualitative Activity Recognition of Weight Lifting Exercises."
           )       
    ),
    column(6,
           strong(textOutput("text")),
           verbatimTextOutput("summary"),
           strong("Accuracy Measurements"),
           verbatimTextOutput("sensitivity"),verbatimTextOutput("accuracy"),
           br(),
           strong("Performance of the prediction model on the Cross-Validation data set"),
           tableOutput("outputTable")
    )
  )
))

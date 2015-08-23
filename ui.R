library(shiny)

shinyUI(pageWithSidebar(
        
        # Title
        headerPanel("Car Fuel Simple Consumption Predictor"),
        
        # Sidebar with slider and numeric inputs
        sidebarPanel(
                h3("Car attributes"),
                radioButtons('transmission', label = ("Transmission"),
                             choices = list("Automatic" = 1, "Manual" = 0),selected = 1),
                numericInput('cylinders','Cylinders (number of cylinders)',4,min=4,max=8,step=2),
                sliderInput('weight','Weight (lb/1000):',min=1.0,max=6.0,value=2.5),
                sliderInput('horsepower','Gross horsepower (hp):',min=40,max=550,value=100)
                ),
        
        # Show the result of the prediction and a histogram as a reference
        mainPanel(
                h3('Prediction'),
                p('The predictor uses the dataset mtcars to make predictions. It used linear regression and ',code('predict'),' function in R.'),         
                br(),
                h3('Predicted fuel consumption of your car: ',verbatimTextOutput("prediction")),
                br(),
                h4('In the plot provided there is consumtion of your car with respect to others'),
                plotOutput("distPlot")
        )
        ))
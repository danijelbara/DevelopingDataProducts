library(shiny)

data(mtcars)
mtcars$am <- factor(mtcars$am)
pod <- lm(mpg ~ wt + cyl + hp + am, data=mtcars)

      Consumption.Prediction <- function(weight,cylinders,horsepower,transmission){
                predict(pod,newdata=data.frame(wt=weight,cyl=cylinders,hp=horsepower, am=transmission))  
       } 


shinyServer(
        
        function(input, output) {
                
                output$inputValue1 <- renderPrint({input$weight})
                output$inputValue2 <- renderPrint({input$cylinders})
                output$inputValue3 <- renderPrint({input$horsepower})
                output$inputValue3 <- renderPrint({input$transmission})
                output$prediction <- renderPrint({Consumption.Prediction(input$weight,input$cylinders,input$horsepower,input$transmission)})
                output$distPlot <- renderPlot({
                        
                        # generate bins based on input$bins from ui.R
                        x <- mtcars$mpg
                        y <- Consumption.Prediction(input$weight,input$cylinders,input$horsepower,input$transmission)
                        
                        bins <- seq(min(x,y), max(x), length.out = 11)
                        
                        # draw the histogram with the specified number of bins
                        hist(x, breaks = bins, col = rainbow(30, start = 0, end = 1), border = 'black', xlab="Miles per gallon",
                        main="Distribution of fuel consumption ")        
                        lines(c(y,y),c(0,10),col='blue',lwd=4)
                        ylim = c(0,50)
                        legend("topright","Your car",lty = 1,col="blue",lwd=4)
                        
                })
                
        })
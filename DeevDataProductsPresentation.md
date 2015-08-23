Developing Data Products - Course Project
========================================================





author: Danijel Bara

date:   23.08.2015

Introduction
========================================================

This shiny application has been created as a course project for the "Developing Data Products" under Coursera. It contains supporting documentation for users to get started with the application.

The app developed for the first part of the assignment is avalilable at:
https://danijelbara.shinyapps.io/DevDataProduct_ShinyApp

Source code for ui.R and server.R files are available on the GitHub:
https://github.com/danijelbara/DevelopingDataProducts

Car Fuel Simple Consumption Predictor
========================================================

The shiny app predicts the fuel consumption of a car with the following properties:

* Transmission
* Weight
* Cylinders
* Horsepower

After inputs prediction model is developed for predicting mileage of a car. 


Mtcars data set
========================================================

The data used in the app comes from the Motor Trend Car Road Tests (mtcars) dataset. The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models). We can look to some carachteristics of the data:


```r
head(mtcars, n=2)
```

```
              mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4      21   6  160 110  3.9 2.620 16.46  0  1    4    4
Mazda RX4 Wag  21   6  160 110  3.9 2.875 17.02  0  1    4    4
```

The prediction algorithm
========================================================
The prediction algorithm is based on a standard linear regression model of the data in the mtcars dataset using the weight, cylinders, horsepower and transmission variables of the dataset.

model <- lm(mpg ~ wt + cyl + hp + am, data = mtcars)

Given new data for a given by the user, for instance:
* transmission <- Automatic
* cylinders <- 6
* weight <- 2
* horsepower <- 100

Results
========================================================
We are able to predict car fuel consumtion:


predict(model,newdata=data.frame(wt=weight,cyl=cylinders,hp=horsepower, am=transmission))


```
       1 
25.44557 
```

## Have fun!

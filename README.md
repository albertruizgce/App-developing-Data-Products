This example demonstrates a core feature of Shiny: **AlApe**. In `server.R`, show the form that you can plot a 
simple linear regression with `rCharts` using `mtcars` data set . 

You can choose the explanatory variable and numbers of cylinders for do 
the regression vs dependent variable miles per galon (mpg). Try changing the explanatory variable (using *Choose 
variable*) and change number of cylinders (using *Choose cylinder*). When you choose, the results that you can see 
are a regression graphics with adjusted line, a summary regression where you can see the estimated parameters and 
a general summary with the variables used in the linear regression.  

The graphic is interactive, because if you pass the mouse in one point you can see the value of coordinate, you can choose see only the line of regression, or only the data's dispersion if you click in the graphic's legend in the number 2,1 or both.

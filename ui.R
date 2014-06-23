### server
library(shiny)
library(rCharts)
library(datasets)
shinyServer(
  function(input, output) {
  output$myChart <- renderChart2({
    if(input$y=='All') {
      datos<-mtcars
    } else{
      datos<-mtcars[mtcars$cyl==input$y,]
    }
    reg<-lm(mpg~datos[,input$x],data=datos)
    datoso<-cbind(datos[,input$x],datos$mpg,rep(1,nrow(datos)))
    datosr<-cbind(datos[,input$x],reg$fitted.values,rep(2,nrow(datos)))
    datos1<-rbind(datoso,datosr)
    colnames(datos1)=c(input$x,"mpg","aux")
    datos1<-as.data.frame(datos1)
    h1 <- hPlot(input$x, y = "mpg", data = datos1, type = c("scatter","line")
                , group = "aux", size = "gear")
    return(h1)
  })
  output$summaryreg<-renderPrint({
    if(input$y=='All') {
      datos<-mtcars
    } else{
      datos<-mtcars[mtcars$cyl==input$y,]
    }
    reg<-lm(mpg~datos[,input$x],data=datos)
    summary(reg)
    })
  output$summary<-renderPrint({
    if(input$y=='All') {
      datos<-mtcars
    } else{
      datos<-mtcars[mtcars$cyl==input$y,]
    }
    t(round(as.data.frame(rbind(summary(datos$mpg),summary(datos[,input$x]),
                        deparse.level = 0),row.names=c("mpg",input$x)),1))
    })
})

### ui
library(shiny)
library(datasets)
require(rCharts)
shinyUI(pageWithSidebar(
  headerPanel("AlApe"),

sidebarPanel(
    selectInput(inputId = "x",
      label = "Choose variable",
      choices = c('disp', 'wt', 'qsec', 'hp', 'drat', 'gear', 'carb'
                  ),
      selected = "disp"),
    selectInput(inputId = "y",
                label = "Choose cylinder",
                choices =list("ALL" = 'All', "4 CYL" = 4,
                              "6 CYL" = 6, '8 CYL'=8), selected = 'All'),
    br(),
    br(),
    br(),
    h5('Summary of Select Variables', align = "center"),
    verbatimTextOutput("summary"),
    br(),
    br(),
    br(),
    p("For a description, source and examples of data set visit ",
      a("mtcars", 
        href = "http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")),    
    width=3),
  mainPanel(
    h4('Figure', align = "center"),
    showOutput("myChart", "highcharts"),
    h4('Summary Regression', align = "center"),
    verbatimTextOutput("summaryreg"),
    width=9  )
))

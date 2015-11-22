library(ggplot2)
library(datasets)
library(caret)
library(randomForest)
data(trees)


pickPlot <- function(oneby, twoby, plotstyle) {
  X <- trees[,oneby]
  Y <- trees[,twoby]
  
  if (plotstyle == 'Separate Regressions')
{
  treePlot <- qplot(X, Y, data=trees, geom=c("point", "smooth"), 
        method="lm", formula=y~x, xlab=oneby, ylab=twoby)
  return(treePlot)
 
  }
  
 else 
  {
    if(plotstyle == 'Boxplots')
    {
      treePlot <- qplot(X, Y, data=trees, geom=c("boxplot", "jitter"), fill=X, xlab=oneby, ylab=twoby)
    return(treePlot)
    }
  }
}

getSig <- function(oneby, twoby)
{

  sig <- t.test(trees[,oneby], trees[,twoby], paired = TRUE)
return(sig)
}


shinyServer(
  function(input, output) {
    output$oneby <- renderPrint({input$oneby})
    output$twoby <- renderPrint({input$twoby})
    output$plotstyle <- renderPrint({input$plotstyle})
 
    output$treePlot <- renderPlot({pickPlot(input$oneby, input$twoby, input$plotstyle)})
    output$sig <- (renderPrint({getSig(input$oneby, input$twoby)}))
  }
)
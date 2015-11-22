library(shiny)

shinyUI(pageWithSidebar(
  headerPanel('Black Cherry Tree Growth Measure Plotting'),
  sidebarPanel(
    selectInput('oneby', 'Choose X value', choices = c('Girth' = 'Girth', 'Volume' = 'Volume', 'Height' = 'Height')),
    selectInput('twoby', 'Choose Y value', choices = c('Girth' = 'Girth', 'Volume' = 'Volume', 'Height' = 'Height')),
    selectInput('plotstyle', 'Choose plot', choices = c('Separate Regressions' = 'Separate Regressions', 'Boxplots' = 'Boxplots'))
   ),
  mainPanel(
    p('For documentation purposes: this application will enable you to plot any measure of tree growth in this dataset against any other, in one of two ways. It also performs a paired t-test to determine relationship of significance between two columns. Please use the selectors in the side bar to choose one of the three possible growth measure for X and Y values.  Use the third selector to choose between our two plot styles.  This application makes use of the "trees" dataset from the R datasets package and the ggplot2 package.'),
   
    h4('Your plot:'),
    plotOutput('treePlot'),
    
    h4('Significance of Y to X:'),
    verbatimTextOutput('sig')
  )
))
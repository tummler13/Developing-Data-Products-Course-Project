#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

# DDPApplication
ui <- fluidPage(
    
    # Caption
    titlePanel(" Data of a geyser"),
    
    # Slider to control number of inputs and outputs
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),
        
        # Mainscreen has the plot
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

# Backend Part
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        #generating bins
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        #histogram of data
        hist(x, breaks = bins, col = 'blue', border = 'yellow')
    })
}

# Application to be run now
shinyApp(ui = ui, server = server)
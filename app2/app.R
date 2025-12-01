#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

# APP 2 - CUSTOM CORRELATION

library(shiny)
library(tidyverse)

DD_16 <- full_NDVI_data |>
  mutate(Date = as.Date(Date)) |>
  left_join(DD_data, by = join_by("Date" == "TIMESTAMP"))

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Comparing various variables with flux"), #title 
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(  # layout of panels that includes a sidebar
    sidebarPanel(   # creates a sidebar panel
      checkboxGroupInput("Site",
                         "Sites to show:",
                         choices = c("CA-NS1", "CA-NS2", "CA-NS3", "CA-NS4", "CA-NS5", "CA-NS6", "CA-NS7"),
                         selected = c("CA-NS1", "CA-NS2", "CA-NS3", "CA-NS4", "CA-NS5", "CA-NS6", "CA-NS7")
      ),
      radioButtons("Variable",
                   "Variable:",
                   choices = c("VPD_F", "CO2_F_MDS"),
                   selected = "VPD_F"
                    )
    ),
    #sidebarPanel(   # creates a sidebar panel
    #  radioButtons("Variable",
    #                     "Variable:",
    #                     choices = c("VPD_F", "CO2_F_MDS"),
    #                     selected = "VPD_F"
     # )
    #),
    
    # Show a plot of the generated distribution
    mainPanel(   # creates the main panel
      #plotOutput("distPlot")   # output id
      plotOutput("scatterPlot")#,
      #tableOutput("statTable")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$scatterPlot <- renderPlot({
    DD_data |>
      filter(Site %in% input$Site) |>
      ggplot(aes_string(x = input$Variable,
                        y = "NEE_VUT_REF",
                        color = "Site")) +
      geom_point(size = 1) +
      geom_smooth(se = F) +
      labs(x = "Variable",
           y = "Flux",
           title = '') +
      #scale_x_continuous(limits = c(2.500, 6.500)) +
      #scale_y_continuous(limits = c(30, 62)) +
      theme_bw()
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

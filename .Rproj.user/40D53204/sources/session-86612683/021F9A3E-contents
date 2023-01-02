library(ggplot2)
library(rsconnect)

mydata<-readxl::read_excel("C:/R-4.2.1/mef06-aktas8154/Shniy/foreign_students_by_nationality_2021_2022.xlsx")

ui<-fluidPage(
  titlePanel(strong("Foreign Students Number in Turkey")),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("Province",
                       "Province:",
                       c("All",
                         unique(as.character(mydata$`İl Adı`))))
    ),
    column(4,
           radioButtons(inputId = "University Type",
                       "University Type:",
                        choices = c("All",
                                    unique(as.character(mydata$`Üniversite Türü`))))
    ),
    column(4,
           selectInput("University Name",
                       "University Names:",
                       c("All",
                         unique(as.character(mydata$`Üniversite Adı`))))
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table")
)

server <- function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable(
    {
      data <- mydata
      if (input$Province != "All") {
        data <- data[data$`İl Adı`== input$Province,]
      }
      if (input$`University Type` != "All") {
        data <- data[data$`Üniversite Türü` == input$`University Type`,]
      }
      if (input$`University Name` != "All") {
        data <- data[(data$`Üniversite Adı` == input$`University Name`) & (data$`İl Adı`== input$Province),]
      }
      data
    }))
  
}

shinyApp(ui,server)

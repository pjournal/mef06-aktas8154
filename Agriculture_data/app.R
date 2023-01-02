

library(shiny)
data<-readxl::read_excel("Agriculture_data/foreign_students_by_nationality_2021_2022.xlsx")

server = function(input,output,server) {}

ui = basicPage("Foreign_Students_Number_by_Nationality")

# Create Shiny app ----
shinyApp(ui = ui, server = server)

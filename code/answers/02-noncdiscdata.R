# ?teal_data
# ?dataset
# ?teal.modules.general -> index
# ?tm_data_table

library(teal.modules.general)

app <- init(
  data = teal_data(
    dataset("iris", iris),
    dataset("mtcars", mtcars)
  ),
  modules = modules(
    tm_data_table(
      label = "My Data Table"
    )
  ),
  header = "R/Pharma Workshop"
)

shinyApp(app$ui, app$server)
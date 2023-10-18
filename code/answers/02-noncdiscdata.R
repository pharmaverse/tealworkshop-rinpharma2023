# ?teal_data
# ?dataset
# ?teal.modules.general -> index

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
  header = "my teal app"
)

shinyApp(app$ui, app$server)
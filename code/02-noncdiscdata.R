# ?teal_data
# ?dataset
# ?teal.modules.general -> index
app <- init(
  data = teal_data(

  ),
  modules = modules(

  ),
  header = "my teal app"
)

shinyApp(app$ui, app$server)
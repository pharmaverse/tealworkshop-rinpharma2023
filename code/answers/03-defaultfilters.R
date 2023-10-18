# Adding Default filters
# ?teal::init --> filter argument
# ?teal::teal_slices
# ?teal.slice::teal_slice
# add default filter on iris, Species column, with selected value virginica
# add count_type argument and set it to "all", what happens now?
# add default fixed filter on mtcars, cyl column, with selected value 4
# add default anchored filter on mtcars, gear column, with selected value 3
# update the filter on iris as anchored and fixed filter
# create custom expression: Species == 'virginica' and Sepal.Length > 5.0 

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
  header = "my teal app",
  filter = teal_slices(
    teal_slice(dataname = "iris", varname = "Species", id = "iris_species", selected = "virginica", anchored = TRUE, fixed = TRUE),
    teal_slice(dataname = "mtcars", varname = "cyl", id = "mtcars_cyl", selected = 4, fixed = TRUE),
    teal_slice(dataname = "mtcars", varname = "gear", id = "mtcars_gear", selected = 3, anchored = TRUE),
    count_type = "all"
  )
)

shinyApp(app$ui, app$server)
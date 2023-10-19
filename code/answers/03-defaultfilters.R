# Adding Default filters
# ?teal::init --> filter argument
# ?teal::teal_slices
# ?teal.slice::teal_slice
# add default filter on iris, Species column, with selected value virginica
# add default filter on iris, Sepal.Width column, with selected value between 3 - 4
# add count_type argument and set it to "all", what happens now?
# add default fixed filter on mtcars, cyl column, with selected value 6, 8
# add default anchored filter on mtcars, gear column
# add anchored and fixed filter on am (transmission), with selected value 1 (manual)
# create custom expression on iris where Petal.Length > 4 & Petal.Width > 1

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
    teal_slice(dataname = "iris", varname = "Species", selected = "virginica"),
    teal_slice(dataname = "iris", varname = "Sepal.Width", selected = c(3, 4)),
    teal_slice(dataname = "mtcars", varname = "cyl", selected = c(6, 8), fixed = TRUE),
    teal_slice(dataname = "mtcars", varname = "gear", anchored = TRUE),
    teal_slice(dataname = "mtcars", varname = "am", selected = 1, anchored = TRUE, fixed = TRUE),
    teal_slice(dataname = "iris", expr = "Petal.Length > 4 & Petal.Width > 1", title = "Custom iris", id = "custom_iris"),
    count_type = "all"
  )
)

shinyApp(app$ui, app$server)
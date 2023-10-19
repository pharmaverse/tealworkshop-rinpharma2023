# Adding Default filters
# 
# ?teal::init --> filter argument
# ?teal::teal_slices
# ?teal.slice::teal_slice
# add default filter on iris, Species column, with selected value virginica
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
      label = "Data Table Module"
    )
  ),
  header = "R/Pharma 2023 teal Workshop",
  filter = 
)

shinyApp(app$ui, app$server)
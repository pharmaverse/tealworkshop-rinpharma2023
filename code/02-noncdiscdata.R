# teal with non-cdisc data
# 
# ?teal_data
# ?dataset
# Show what the data object looks like
# 
# Let's use a module from teal.modules.general
# ?teal.modules.general -> index
# ?tm_data_table
# use tm_data_table, change the label value to "Data Table Module"
# 
# add header: R/Pharma 2023 teal Workshop

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
  header = "R/Pharma 2023 teal Workshop"
)

shinyApp(app$ui, app$server)
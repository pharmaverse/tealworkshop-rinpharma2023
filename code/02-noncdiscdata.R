# ?teal_data
# ?dataset
# Show what the data object looks like
# 
# Let's use a module from teal.modules.general
# ?teal.modules.general -> index
# ?tm_data_table
# use tm_data_table, change the label value to "Data Table Module"
# 
# add header: R/Pharma Workshop

library(teal.modules.general)

app <- init(
  data = ,
  modules = 
    
)

shinyApp(app$ui, app$server)
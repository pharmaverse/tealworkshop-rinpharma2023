# Let's create a very simple teal app
# 
# ?teal::init
# - what are the required parameters?
# 
# ?modules and module
# 
library(teal)

app <- init(
  data = list(dummy_data = data.frame()),
  modules = modules(
    module(
      ui = function(id){
        label = "hello world module"
        tags$div("Hello World")
      }
    )
  )
)

shinyApp(app$ui, app$server)
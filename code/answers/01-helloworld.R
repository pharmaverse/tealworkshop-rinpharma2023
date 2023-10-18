#############################
# ANSWER:
#############################
library(teal)

app <- init(
  data = list(dummy_data = data.frame()),
  modules = list(
    module(
      ui = function(id) {
        tags$p("Hello World!")
      }
    )
  )
)

shinyApp(app$ui, app$server)
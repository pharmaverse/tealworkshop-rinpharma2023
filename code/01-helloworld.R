#############################
# Let's create a very simple "Hello World!" teal app.
# ?teal::module
#############################

library(teal)

# Let's look at ?teal::init, what are the required arguments?
# Let's look at ?teal::module, what are the required arguments?
app <- init(
  data = list(),
  modules = list()
)

shinyApp(app$ui, app$server)

# Where are the rest of the teal features?
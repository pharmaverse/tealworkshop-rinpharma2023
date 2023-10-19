# teal with cdisc data
# 
# We'll use teal.modules.clinical
# ?teal.modules.clinical -> index
# 
# Check available example data from tmc
# data(package = "teal.modules.clinical")
# let's get data from tmc: ADSL, ADAE, and ADTTE
# 
# add tm_t_summary
# - arm_var: choices ARM, ARMCD : selected = "ARM"
# - summarize_vars: choices "SEX", "RACE", "BMRKR2", "EOSDY", "DCSREAS", "AGE" : selected "SEX", "RACE"
# 
# let's add visualization module
# 
# add tm_t_events module
# - arm_var: choices ARM, ARMCD : selected = "ARM"
# - hlt: variable_choices "AEBODSYS", "AESOC" : selected = "AEBODSYS"
# - llt: variable_choices "AETERM", "AEDECOD" : selected = "AEDECOD"
# 
# explain about variable_choices wrapper
# explain about value_choices wrapper
# 
# add tm_g_km module
# - arm_var: choices ARM, ARMCD, ACTARMCD : selected = "ARM"
# - paramcd: value choices PARAMCD, PARAM : selected = "OS"
# - strata_var: variable choices SEX BMRKR2 : selected = NULL
# - facet_var: variable choices SEX BMRKR2 : selected = NULL
# - plot_height 600L, 400L, 5000L

library(teal.modules.clinical)

app <- init(
  data = ,
  modules = ,
  header = "R/Pharma 2023 teal Workshop"
)

shinyApp(app$ui, app$server)
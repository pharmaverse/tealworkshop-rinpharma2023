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

ADSL <- teal.modules.clinical::tmc_ex_adsl
ADAE <- teal.modules.clinical::tmc_ex_adae
ADTTE <- teal.modules.clinical::tmc_ex_adtte

app <- init(
  data = cdisc_data(
    cdisc_dataset("ADSL", ADSL, code = "ADSL <- teal.modules.clinical::tmc_ex_adsl"),
    cdisc_dataset("ADAE", ADAE, code = "ADAE <- teal.modules.clinical::tmc_ex_adae"),
    cdisc_dataset("ADTTE", ADTTE, code = "ADTTE <- teal.modules.clinical::tmc_ex_adtte")
  ),
  modules = modules(
    tm_t_summary(
      label = "Demographic Table", 
      dataname = "ADSL",
      arm_var = choices_selected(choices = c("ARM", "ARMCD"), selected = "ARM"),
      summarize_vars = choices_selected(
        choices = c("SEX", "RACE", "BMRKR2", "EOSDY", "DCSREAS", "AGE"),
        selected = c("SEX", "RACE")
      )
    ),
    tm_t_events(
      label = "AE Table",
      dataname = "ADAE",
      arm_var = choices_selected(choices = c("ARM", "ARMCD"), selected = "ARM"),
      hlt = choices_selected(
        choices = variable_choices(ADAE, c("AEBODSYS", "AESOC")),
        selected = "AEBODSYS"
      ),   
      llt = choices_selected(
        choices = variable_choices(ADAE, c("AETERM", "AEDECOD")),
        selected = c("AEDECOD")
      )
    ),
    tm_g_km(
      label = "KM Plot",
      dataname = "ADTTE",
      arm_var = choices_selected(choices = c("ARM", "ARMCD", "ACTARMCD"), selected = "ARM"),
      paramcd = choices_selected(choices = value_choices(ADTTE, "PARAMCD", "PARAM"), selected = "OS"),
      strata_var = choices_selected(variable_choices(ADSL, c("SEX", "BMRKR2")), NULL),
      facet_var = choices_selected(variable_choices(ADSL, c("SEX", "BMRKR2")), NULL),
      plot_height = c(600L, 400L, 5000L),
    )
  ),
  header = "R/Pharma 2023 teal Workshop"
)

shinyApp(app$ui, app$server)
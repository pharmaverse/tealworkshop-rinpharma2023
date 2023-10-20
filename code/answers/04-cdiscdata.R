# teal with cdisc data
# 
# We'll use teal.modules.clinical
# ?teal.modules.clinical -> index
# 
# Check available example data from tmc
# data(package = "teal.modules.clinical")
# let's get data from tmc: ADSL, ADAE, and ADTTE
# 
# add tm_t_summary on ADSL
# - label = "Demographic Table"
# - arm_var: choices ARM, ARMCD : selected = "ARM"
# - summarize_vars: choices "SEX", "RACE", "BMRKR2", "EOSDY", "DCSREAS", "AGE" : selected "SEX", "RACE"
# 
# let's add visualization module
# 
# add tm_t_events module on ADAE
# - label: Adverse Event Table
# - arm_var: choices ARM, ARMCD : selected = "ARM"
# - llt: variable_choices "AETERM", "AEDECOD" : selected = "AEDECOD"
# - hlt: variable_choices "AEBODSYS", "AESOC" : selected = "AEBODSYS"
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
    # module 
    tm_t_summary(
      "Demographic Table",
      "ADSL",
      arm_var = choices_selected(
        choices = c("ARMCD", "ARM"),
        selected = "ARM"
      ),
      summarize_vars = choices_selected(
        choices = c("SEX", "RACE", "BMRKR2", "EOSDY", "DCSREAS", "AGE"),
        selected = c("SEX", "RACE")
      )
    ),
    tm_t_events(
      "Adverse Event Table",
      "ADAE",
      arm_var = choices_selected(
        choices = variable_choices(ADSL, c("ARMCD", "ARM")),
        selected = "ARM"
      ),
      llt = choices_selected(
        choices = variable_choices(ADAE, c("AETERM", "AEDECOD")),
        selected = "AEDECOD"
      ),
      hlt = choices_selected(
        choices = variable_choices(ADAE, c("AEBODSYS", "AESOC")),
        selected = "AEBODSYS"
      )      
    ),
    tm_g_km(
      "KM PLot",
      "ADTTE",
      arm_var = choices_selected(
        choices = variable_choices(ADSL, c("ARMCD", "ARM")),
        selected = "ARM"
      ),
      paramcd = choices_selected(
        choices = value_choices(ADTTE, "PARAMCD", "PARAM"),
        selected = "OS"
      ),
      strata_var = choices_selected(
        choices = c("SEX", "BMRKR2"),
        selected = NULL
      ),
      facet_var = choices_selected(
        choices = c("SEX", "BMRKR2"),
        selected = NULL
      ),
      plot_height	= c(600L, 400L, 5000L)
    )
  ),
  header = "R/Pharma 2023 teal Workshop"
)

shinyApp(app$ui, app$server)
# Add module specific filters
#
# Let's add meaningful filters to the module
# tm_t_summary: 
# - Safety-evaluable population: ADSL.SAFFL == Y, fixed & anchored
#
# tm_t_events: 
# - Safety-evaluable population: ADSL.SAFFL == Y, fixed & anchored
# - Serious Events: ADAE.AESER, anchored
# - Grade 3+ Related Events: ADAE.AEREL == 'Y' & ADAE.AETOXGR %in% c('3', '4', '5'), custom expression
#
# Global filters for all three modules
# Female only: ADSL.SEX == 'F', fixed (optional)
# Young adults only: ADSL.AGE >= 18 & AGE <= 30, fixed (optional)
# 
# ?teal::init
# ?teal::teal_slices
# 
# important arguments: module_specific and mapping
# don't forget count_type = 'all'

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
  header = "R/Pharma 2023 teal Workshop",
  filter = 
)

shinyApp(app$ui, app$server)
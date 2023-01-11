
# 0. Setup ----------------------------------------------------------------
{
  library(tidyverse)
  library(dbplyr)
  library(DBI)
  library(nycflights13)
  library(palmerpenguins)
}


# 1. Connect to DB --------------------------------------------------------
{
  insurance_data = read_csv("../external/in/insurance3r2.csv")
  con = DBI::dbConnect(duckdb::duckdb(), dbdir=":memory:")
  df <- copy_to(con, insurance_data)
}


# 2. Write Query ----------------------------------------------------------
#' In this example we want to demonstrat a few things. 
#'   - selection
#'   - filtering
#'   - macro for recoding age
{
  ## R
  recode_age = function(age){
    if ( age <= 20 ) { return('0-20')}
    else if (age <= 60) {return('21-60')}
    else {return("60+")}
  }
  insurance_data %>% 
    mutate(age_grp = case_(age)) %>% 
    select(age, age_grp, sex, region, bmi, smoker, charges)
  
  ## SQL
  df %>%
    mutate(age_grp = case_when(age<=20 ~ "0-20",
                               age <= 60 ~ "21-60",
                               TRUE~"60+")) %>% 
    select(age, age_grp, sex, region, smoker, charges)%>% 
    show_query()
  
}

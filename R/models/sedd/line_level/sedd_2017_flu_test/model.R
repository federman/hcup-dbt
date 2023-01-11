# 0. Setup ----------------------------------------------------------------
{ 
  ## Load Dependencies
  rm(list= ls())
  library(dplyr)
  library(dbplyr)
  library(DBI)
  library(nycflights13)
  library(palmerpenguins)
  library(rstudioapi)
  library(tidyverse)
  library(glue)
  library(lubridate)
  library(arrow)
 
  
  ## Set directory 
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  db_dir = "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\Database\\Prototype\\parquet\\"

  ## Set target parameters
  dataset_id = "NY_SEDD_2017_CORE"
  model_id = "sedd_2017_flu_test"

}


# 1. Connect to DuckDB --------------------------------------------------
{
  ## get subset
  db = arrow::open_dataset(glue("{db_dir}{dataset_id}.parquet"))
  dfa = db %>% 
    head(n=100) %>% 
    collect()
  
  ## Create duckdb connection
  con = DBI::dbConnect(duckdb::duckdb(), dbdir=":memory:")
  df <- copy_to(con, dfa)
  
}

# 2.  Query ----------------------------------------------------------
 
## 2.1 Local variables ----------------------------------------------------------
flu_diag <- c('J1000', 'J1001', 'J1008','J101','J102','J1081','J1082', 'J1083','J1089',
              'J1100','J1108', 'J111','J112','J1181','J1182','J1183','J1189', 'J09X1','J09X2','J09X3','J09X9')

flu_like_diag <- c('J069', 'J399', 'J200', 'J201','J202', 'J203', 'J204', 'J205',
                   'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40','B012',
                   'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129',
                   'J440', 'J441', 'J470', 'J471')  

## 2.2 Stage ----------------------------------------------------------
query =  df %>% 
  mutate(
    admit_date = paste0(AYEAR,"-",AMONTH,"-01"),
    flu = I10_DX_Visit_Reason1 %in% flu_diag | I10_DX_Visit_Reason2 %in% flu_diag | I10_DX1 %in% flu_diag | I10_DX2 %in% flu_diag,
    flu_like  = I10_DX_Visit_Reason1 %in% flu_like_diag | I10_DX_Visit_Reason2 %in% flu_like_diag | I10_DX1 %in% flu_like_diag | I10_DX2 %in% flu_like_diag,
  ) %>% 
  select(
    KEY,
    AGE, DIED, RACE, HISPANIC, FEMALE, PAY1, ZIP,
    admit_date, flu, flu_like
  ) 

query %>% show_query()
q1_res <- copy_to(con, collect(query))
## 2.3 Mart  ----------------------------------------------------------

q2 = q1_res %>% 
  mutate(
    ili_diagnosis_var = case_when(
      flu & flu_like ~ "BOTH",
      flu & !flu_like ~ "ILI",
      !flu & flu_like ~ "ILI LIKE",
      TRUE ~ "OTHER"
    )
  )
q2 %>% show_query()

## 2.3 ZIP Layer  ----------------------------------------------------------

q2_res <- copy_to(con, collect(q2))

q3 = q2_res %>% 
  count(AGE, RACE, HISPANIC, ZIP, FEMALE, flu, flu_like, ili_diagnosis_var)
q3%>% show_query()

 
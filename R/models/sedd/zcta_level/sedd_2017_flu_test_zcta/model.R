# 0. Setup ----------------------------------------------------------------
{ 
  ## Load Dependencies
  rm(list= ls())
  library(rstudioapi)
  library(tidyverse)
  library(glue)
  library(lubridate)
  library(arrow)
 
  
  ## Set directory 
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  db_dir = "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\Database\\Prototype\\parquet\\"
  codebook_dir = "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\Database\\Prototype\\codebooks\\"
  model_dir = "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\Database\\Prototype\\models\\"
  
  ## Set target parameters
  dataset_id = "NY_SEDD_2017_CORE"
  model_id = "sedd_2017_flu_test_zcta"

}


# 1. Connect to Database --------------------------------------------------
{

  ## Open database
  db = arrow::open_dataset(glue("{db_dir}{dataset_id}.parquet"))
  db
  
  ## Open codebook
  codebook = read_csv((glue("{codebook_dir}{dataset_id}_codebook.csv")))
  codebook
  
}

# 2.  Query ----------------------------------------------------------
 
## 2.1 Local variables ----------------------------------------------------------
flu_diag <- c('J1000', 'J1001', 'J1008','J101','J102','J1081','J1082', 'J1083','J1089',
              'J1100','J1108', 'J111','J112','J1181','J1182','J1183','J1189', 'J09X1','J09X2','J09X3','J09X9')

flu_like_diag <- c('J069', 'J399', 'J200', 'J201','J202', 'J203', 'J204', 'J205',
                   'J206', 'J207', 'J208', 'J209', 'J210', 'J211', 'J218', 'J219', 'J40','B012',
                   'B052', 'B0681', 'B250', 'J120', 'J121', 'J122', 'J123', 'J1281', 'J1289', 'J129',
                   'J440', 'J441', 'J470', 'J471')  

## 2.2 Write query ----------------------------------------------------------
query =  db %>% 
  mutate(
    admit_date = paste0(AYEAR,"-",AMONTH,"-01"),
    flu = I10_DX_Visit_Reason1 %in% flu_diag | I10_DX_Visit_Reason2 %in% flu_diag | I10_DX1 %in% flu_diag | I10_DX2 %in% flu_diag,
    flu_like  = I10_DX_Visit_Reason1 %in% flu_like_diag | I10_DX_Visit_Reason2 %in% flu_like_diag | I10_DX1 %in% flu_like_diag | I10_DX2 %in% flu_like_diag,
  ) %>% 
  select(
    KEY,
    AGE, DIED, RACE, HISPANIC, FEMALE, PAY1, ZIP,
    admit_date, flu, flu_like
  ) %>% 
  group_by(ZIP,RACE, HISPANIC,admit_date) %>% 
  count(flu, flu_like) %>% 
  ungroup()

## 2.3 Collection + transform  ----------------------------------------------------------
output = query %>% 
  collect()  %>% 
  mutate(
    ili_diagnosis_var = case_when(
      flu & flu_like ~ "BOTH",
      flu & !flu_like ~ "ILI",
      !flu & flu_like ~ "ILI LIKE",
      TRUE ~ "OTHER"
    ),
    admit_date  = ymd(admit_date, quiet = T) 
  ) 

## 2.4 Document Transformations  ----------------------------------------------------------
#' please document your new transformations in transformations.csv


# 3.  Save results ----------------------------------------------------------

## 3.1  Generate codebook ----------------------------------------------------------
model_codebook = tibble(var = names(output)) %>% 
  left_join(codebook) %>% 
  drop_na() %>% 
  bind_rows(read_csv("tranformations.csv") %>% 
              mutate(dataset_id = model_id))
  

## 3.2  Generate model metadata ----------------------------------------------------------
model_details = list(
  type = "table",
  model_id = model_id,
  n_columns = ncol(output),
  n_rows = nrow(output),
  path = glue("{model_dir}{model_id}.parquet"),
  database = "sedd",
  relation =  glue("{dataset_id}.{model_id}")
)

## 3.3  Write to database  ----------------------------------------------------------
arrow::write_parquet(output,
                     sink = model_details$path)

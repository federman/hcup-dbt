```r
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
```
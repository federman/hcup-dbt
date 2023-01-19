{% docs mart__er_flu__zip_level_description %}

This final user facing table is meant the analysis of all emergency room HCUP related encounters for NY for the years of 2017 and 2018; all counts are aggregated at the zip-code level. It includes basic demographics as well as indiciators for flu, flu-like or ILI diagnosis. Staging and intermediate columns are removed. 

To access this table, you can use the following code:

```r
library(dplyr)
library(arrow)

## work within Arrow 
db = arrow::open_dataset("\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__er_flu__zip_level.parquet")
db %>% filter(flu) 

## work  within RAM
df = db %>% collect()
df %>% filter(flu) 

```
 
 
{% enddocs %}


{% docs mart__er_flu__zip_level_n_description %}

this columns is the count of encounters by AGE, RACE, HISPANIC, ZIP, FEMALE, flu, flu_like, ili_diagnosis_var.

{% enddocs %}
{% docs mart__flu_ip_urban_rh_description %}

# Origin 

- **Request:** `Number of Inpatient (IP) Flu and ILI visits by race/ethnicity and urbanicity`
- **Origin Issue:** https://github.com/Drexel-UHC/hcup-dbt/issues/9#issuecomment-1413837032 
- **Detail Issue:** https://github.com/Drexel-UHC/hcup-dbt/issues/17

# Access

If you have access to the HCUP encrypted server, you can access this table using the following code:

### R

```r
library(dplyr)
library(arrow)

db = arrow::open_dataset("\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_urban_rh.parquet")
db %>% collect()
```

### Stata

```stata
* Set the path to the Stata dataset
local path_to_dta "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_urban_rh.dta"

* Read the Stata dataset into a Stata dataset
use `path_to_dta', clear

* View the dataset
browse
```

### SAS

```sas
/* Set the path to the SAS dataset */
%let path_to_sas = '\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_urban_rh.sas7bdat';

/* Import the SAS dataset */
proc import datafile="&path_to_sas"
            out=mydata
            dbms=SAS;
run;

/* View the imported dataset */
proc print data=mydata;
run;
```

### Python

```python
import pyarrow as pa
import pyarrow.parquet as pq
import pandas as pd

# Open the Arrow dataset
db = pq.read_table("\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_urban_rh.parquet")

# Convert the dataset to a Pandas DataFrame
df = db.to_pandas()

# View the Pandas DataFrame
print(df)
```
{% enddocs %}

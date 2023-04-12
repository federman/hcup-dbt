{% docs docs__mart__flu_ip_cost_city %}

# Overview 

- **Request:** `Cost of IP Flu and Ili visits by city`
- **Issue:** https://github.com/Drexel-UHC/hcup-dbt/issues/20
- Please comment in the issue above for any questions, issues or requests.

# Access

If you have access to the HCUP encrypted server, you can access this table using the following code:

### R

```r
library(dplyr)
library(arrow)

db = arrow::open_dataset("\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_cost_city.parquet")
df = db %>% collect()
```

### Stata

```stata
* Set the path to the Stata dataset
local path_to_dta "\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_cost_city.dta"

* Read the Stata dataset into a Stata dataset
use `path_to_dta', clear

* View the dataset
browse
```

### SAS

```sas
/* Set the path to the SAS dataset */
%let path_to_sas = '\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_cost_city.sas7bdat';

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

db = pq.read_table("\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__flu_ip_cost_city.parquet")
df = db.to_pandas()
```
{% enddocs %}

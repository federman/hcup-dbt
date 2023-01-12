{% docs mart__er_flu__line_level_description %}

This final user facing model is meant the analysis of all emergency room HCUP related encounters for NY for the years of 2017 and 2018. It includes basic demographics as well as indiciators for flu, flu-like or ILI diagnosis. Staging and intermediate columns are removed.

To access this table, you can use the following code:

```r
library(arrow)
db = arrow::open_dataset("\\\\files.drexel.edu\\encrypted\\SOPH\\UHC\\SchnakeMahl_HCUP\\dbt\\v0\\models\\mart__er_flu__line_level.parquet")
```
 

```
{% enddocs %}
